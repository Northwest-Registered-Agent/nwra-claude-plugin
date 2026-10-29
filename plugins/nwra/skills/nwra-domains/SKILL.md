---
name: nwra-domains
description: Use when the user wants to search for, buy, renew, or manage a domain through Northwest Registered Agent (NWRA) — DNS records and zones, nameservers, domain forwarding/redirects, auto-renew, WHOIS privacy, domain lock (transfer lock), or website hosting.
---

# NWRA domains and DNS

Follow the shared rules in the `nwra-business-services` skill. DNS, nameserver and forwarding changes take effect on the live internet and can break a website or email, so show the exact change (old and new values) and confirm before every one.

## Tools (nwra MCP server, prefixed `v2_client__`)

Finding and buying:
- `get_domains_tool` (read-only) — domains on the account.
- `search_domains_tool` (read-only) — check availability and price. Offer a few alternatives if the first choice is taken.
- `add_new_domain_to_cart_tool` — add a new domain registration to the cart (checkout via `nwra-cart-billing`).
- `add_domain_renewal_to_cart_tool` (destructive) — add a renewal to the cart.
- `search_domain_for_accounts_stage_tool` (read-only), `create_domain_for_accounts_stage_tool` (destructive) — domain search and creation for an account still being set up. Use these only when the regular search and cart tools don't apply.

DNS:
- `get_domain_dns_records_tool` (read-only) — current records. Always read these before changing anything.
- `create_domain_dns_zone_tool` — create the DNS zone if the domain doesn't have one yet.
- `create_domain_dns_record_tool`, `update_domain_dns_record_tool`, `delete_domain_dns_record_tool` (destructive). Before changing or deleting MX, SPF/DKIM/DMARC TXT, or root A/CNAME records, warn that it can affect email or the website.
- `get_domain_nameservers_tool` (read-only), `update_domain_nameservers_tool` (destructive). Changing nameservers moves all DNS away from NWRA; say so before doing it.

Forwarding:
- `set_domain_forwarding_tool`, `update_domain_forwarding_tool`, `delete_domain_forwarding_tool`, `set_bulk_domain_forwarding_tool` (destructive) — redirect a domain to another URL.

Settings (destructive):
- `set_domain_auto_renew_tool` — turn auto-renew on or off. Mention the expiry date when turning it off.
- `set_domain_privacy_tool` — WHOIS privacy.
- `update_domain_lock_tool` — transfer lock. Unlocking is normally only needed to transfer the domain away.
- `activate_website_hosting_addon_tool` — turn on website hosting for the domain.

A domain usually comes before business email; see `nwra-email`.
