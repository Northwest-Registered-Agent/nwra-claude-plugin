#!/usr/bin/env bash
# Repo checks from the Claude plugin directory pre-submission checklist
# (https://claude.com/docs/plugins/pre-submission-checklist) that
# `claude plugin validate --profile directory` may not cover. Checks
# committed files only (git ls-files), since that is what gets submitted.
set -uo pipefail
cd "$(git rev-parse --show-toplevel)"

fail=0
err() { echo "::error::$*"; fail=1; }

KIB=1024
MAX_TEXT_BYTES=$((256 * KIB))  # per non-image, non-font file in a plugin
MAX_ANY_BYTES=$((5 * KIB * KIB))
MAX_FILES=512                  # per plugin

# --- Whole repo -------------------------------------------------------------

while IFS= read -r f; do
  base=$(basename "$f")
  case "$base" in .DS_Store|Thumbs.db|desktop.ini) err "$f: OS junk file must not be committed";; esac
  case "$f" in *__MACOSX*) err "$f: __MACOSX folder must not be committed";; esac
  IFS=/ read -ra segs <<< "$f"
  for s in "${segs[@]}"; do
    [[ "$s" =~ ^[A-Za-z0-9._-]+$ ]] || err "$f: path segment '$s' may only use letters, digits, '.', '-', '_'"
  done
done < <(git ls-files)

# Symlinks (mode 120000) and submodules (mode 160000)
git ls-files -s | awk '$1=="120000"||$1=="160000"{print $1, $4}' | while read -r mode f; do
  echo "::error::$f: symlinks and submodules are not allowed (mode $mode)"
done | grep . && fail=1

if git ls-files -z | xargs -0 grep -l '^version https://git-lfs' 2>/dev/null | grep -q .; then
  err "Git LFS pointer files are not allowed"
fi

if [ -f .gitattributes ] && grep -Eq 'export-ignore|filter=|eol=|text=' .gitattributes; then
  err ".gitattributes must not use export-ignore or content-rewriting attributes"
fi

# --- Per plugin -------------------------------------------------------------

for dir in plugins/*/; do
  dir=${dir%/}
  manifest="$dir/.claude-plugin/plugin.json"
  echo "Checking $dir"

  count=$(git ls-files "$dir" | wc -l | tr -d ' ')
  [ "$count" -le $MAX_FILES ] || err "$dir: $count files (max $MAX_FILES)"

  while IFS= read -r f; do
    [ -f "$f" ] && [ ! -L "$f" ] || continue  # symlinks reported above
    size=$(wc -c < "$f" | tr -d ' ')
    [ "$size" -le $MAX_ANY_BYTES ] || err "$f: $size bytes (max 5 MiB)"
    case "$(tr '[:upper:]' '[:lower:]' <<< "$f")" in
      *.png|*.jpg|*.jpeg|*.gif|*.webp|*.woff|*.woff2|*.ttf|*.otf) ;;
      *.ico|*.pdf|*.zip|*.tar|*.gz|*.mcpb|*.dxt|*.exe|*.dll|*.so|*.dylib)
        err "$f: binary file type is held for review; remove it" ;;
      *) [ "$size" -le $MAX_TEXT_BYTES ] || err "$f: $size bytes (text files max 256 KiB)" ;;
    esac
  done < <(git ls-files "$dir")

  for f in .npmrc bunfig.toml uv.toml package-lock.json bun.lock bun.lockb yarn.lock pnpm-lock.yaml; do
    git ls-files --error-unmatch "$dir/$f" >/dev/null 2>&1 && err "$dir/$f: registry config and lockfiles in the plugin root are held for review"
  done

  # Required repo files
  [ -f "$dir/README.md" ] || err "$dir: README.md is required"
  [ -f LICENSE ] || [ -f "$dir/LICENSE" ] || jq -e '.license' "$manifest" >/dev/null || err "$dir: needs a LICENSE file or a license field"

  # Directory listing fields: required for our listing, and must be https
  for key in homepage privacyPolicyUrl termsOfServiceUrl supportUrl; do
    val=$(jq -r --arg k "$key" '.[$k] // empty' "$manifest")
    [ -n "$val" ] || { err "$manifest: '$key' is required"; continue; }
    [[ "$val" == https://* ]] || err "$manifest: '$key' must be an https:// URL"
  done

  # Icon: must be set and be a real PNG/JPEG/GIF/WebP image
  icon=$(jq -r '.icon // empty' "$manifest")
  if [ -z "$icon" ]; then
    err "$manifest: 'icon' is required for the directory listing"
  elif ! file -b "$dir/$icon" | grep -Eq '^(PNG|JPEG|GIF|RIFF.*Web/P)'; then
    err "$dir/$icon: icon must be a PNG, JPEG, GIF or WebP image"
  fi

  # Remote MCP servers must use https:// or wss://
  if [ -f "$dir/.mcp.json" ]; then
    jq -r '.mcpServers // {} | to_entries[] | select(.value.url) | "\(.key) \(.value.url)"' "$dir/.mcp.json" |
      while read -r name url; do
        [[ "$url" =~ ^(https|wss):// || "$url" == '${user_config.'* ]] || echo "::error::$dir/.mcp.json: server '$name' url must be https:// or wss://"
      done | grep . && fail=1
  fi
done

if [ $fail -ne 0 ]; then
  echo "Submission checks failed"
  exit 1
fi
echo "Submission checks passed"
