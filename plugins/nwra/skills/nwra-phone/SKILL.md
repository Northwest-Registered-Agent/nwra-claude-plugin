---
name: nwra-phone
description: Use when the user wants a business phone number through Northwest Registered Agent (NWRA) — phone plans, finding and reserving a number, call forwarding, voicemail, caller ID name (CNAM), phone app login, changing or reactivating a phone plan.
---

# NWRA business phone

Follow the shared rules in the `nwra-business-services` skill.

## Tools (nwra MCP server, prefixed `v2_client__`)

Getting a number:
- `get_phone_plans_tool` (read-only) — plans and prices.
- `search_available_numbers_tool` (read-only) — available numbers, e.g. by area code. Offer a few choices.
- `reserve_phone_number_tool` — hold a number while the user decides or checks out.
- `add_phone_service_to_cart_tool` — add phone service to the cart (checkout via `nwra-cart-billing`).
- `attach_number_to_provisioned_service` (destructive) — attach a number to phone service that's already active.

Current service (read-only):
- `get_virtual_phones_tool` — the user's numbers.
- `get_phone_settings_tool`, `get_call_forwarding_tool`, `get_voicemail_settings_tool`, `get_cnam_tool`.
- `get_phone_app_username_tool` — the username for signing in to the phone app.

Changes (destructive, confirm first and show old and new values):
- `update_phone_settings_tool`
- `update_call_forwarding_tool` — check the forwarding number with the user digit by digit.
- `update_voicemail_settings_tool`
- `update_cnam_tool` — caller ID name. Carriers can take time to show the change.
- `change_phone_service_plan_tool` — show the price difference.
- `reactivate_phone_service_tool`
