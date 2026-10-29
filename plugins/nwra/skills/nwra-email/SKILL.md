---
name: nwra-email
description: Use when the user wants business email through Northwest Registered Agent (NWRA) — email hosting plans, buying or changing a plan, reactivating email, inboxes, storage or sending usage, SMTP/IMAP settings for a mail client, webmail problems, or email forwarding.
---

# NWRA business email

Follow the shared rules in the `nwra-business-services` skill. Email hosting needs a domain; if the user doesn't have one, start with `nwra-domains`.

## Tools (nwra MCP server, prefixed `v2_client__`)

Plans:
- `get_email_hosting_plans_tool` (read-only) — available plans and prices.
- `get_email_hosting_tool` (read-only) — the user's current email hosting.
- `add_email_hosting_to_cart_tool` — add email hosting to the cart (checkout via `nwra-cart-billing`).
- `activate_email_hosting_addon_tool` (destructive) — turn on email hosting as an add-on.
- `change_email_hosting_plan_tool` (destructive) — switch plans. Show the old and new plan and price difference.
- `reactivate_email_hosting_tool` (destructive) — reactivate cancelled or suspended hosting.

Inboxes and usage (read-only):
- `get_email_inboxes_tool` — inboxes on the domain.
- `get_email_inbox_storage_usage_tool`, `get_email_inbox_send_usage_tool` — storage used and sending volume. Check these when mail bounces or won't send.
- `get_email_smtp_settings_tool` — server settings for Outlook, Apple Mail, phones, etc. Give the user the values in a table.
- `check_webmail_server_reachability_tool` — check whether webmail is up when the user can't sign in.

Forwarding:
- `get_email_forwarding_tool` (read-only).
- `create_email_forwarding_tool`, `update_email_forwarding_tool`, `delete_email_forwarding_tool` (update and delete are destructive) — confirm the source and destination addresses first.

## Troubleshooting

When email isn't working, check in this order: hosting is active (`get_email_hosting_tool`), webmail is reachable, storage and send limits, then the domain's MX records via `nwra-domains`.
