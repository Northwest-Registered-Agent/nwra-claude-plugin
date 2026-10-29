# Northwest Registered Agent plugin for Claude Code

Form and manage your business from Claude Code: business formation, registered agent service, state filings and compliance deadlines, plus a business domain, email, and phone number — all through your [Northwest Registered Agent](https://www.northwestregisteredagent.com) account.

## Install

In Claude Code:

```
/plugin marketplace add Northwest-Registered-Agent/nwra-claude-plugin
/plugin install nwra@nwra-plugins
```

Or from a terminal:

```
claude plugin marketplace add Northwest-Registered-Agent/nwra-claude-plugin
claude plugin install nwra@nwra-plugins
```

Then sign in: run `/mcp`, select `plugin:nwra:nwra`, and log in with your Northwest account in the browser window that opens.

## Commands

| Command | What it does |
| --- | --- |
| `/nwra:status` | Overview of your companies, open orders, and anything needing attention |
| `/nwra:form-business [name] [state] [type]` | Start forming an LLC, corporation, or other entity |
| `/nwra:filings [company]` | Upcoming and overdue state filings and compliance deadlines |
| `/nwra:setup-identity [company or domain]` | Set up a business domain, email, and phone number |

You can also just ask in plain language ("when is my Oregon annual report due?"). The `nwra-business-services` skill holds the shared rules, and area skills (`nwra-account-companies`, `nwra-business-formation`, `nwra-filings-compliance`, `nwra-cart-billing`, `nwra-documents-mail`, `nwra-domains`, `nwra-email`, `nwra-phone`, `nwra-vehicle-registration`) cover each group of tools. Claude always shows you a summary and waits for your confirmation before submitting a filing or placing an order.

## Update

```
claude plugin marketplace update nwra-plugins
claude plugin update nwra@nwra-plugins
```

## Development

```
.claude-plugin/marketplace.json            # marketplace catalog (read by `marketplace add`)
plugins/nwra/
  .claude-plugin/plugin.json               # plugin manifest
  .mcp.json                                # NWRA MCP server (HTTP + OAuth, client id `mcp-connector`)
  commands/                                # slash commands (/nwra:<file-name>)
  skills/nwra-business-services/SKILL.md   # shared rules + router to the area skills
  skills/nwra-*/SKILL.md                   # one skill per tool area (domains, email, phone, ...)
```

Test locally without publishing:

```
claude --plugin-dir ./plugins/nwra
```

Validate before pushing:

```
claude plugin validate .
claude plugin validate plugins/nwra
```

### Releasing

Bump `version` in both `plugins/nwra/.claude-plugin/plugin.json` and `.claude-plugin/marketplace.json`, then:

```
claude plugin validate .
claude plugin tag plugins/nwra
git push --follow-tags
```
