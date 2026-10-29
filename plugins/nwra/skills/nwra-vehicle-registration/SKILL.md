---
name: nwra-vehicle-registration
description: Use when the user wants to register a vehicle through Northwest Registered Agent (NWRA) or check their existing NWRA vehicle registrations.
---

# NWRA vehicle registration

Follow the shared rules in the `nwra-business-services` skill.

## Tools (nwra MCP server, prefixed `v2_client__`)

- `get_vehicle_registrations_tool` (read-only) — existing vehicle registrations.
- `get_vehicle_registration_options_tool` — registration options and prices for the user's situation. It is marked destructive, so tell the user what you're about to look up before calling it.
- `add_vehicle_registration_to_cart_tool` — add a registration to the cart (checkout via `nwra-cart-billing`).

Collect the vehicle and owner details the options require, show a summary with the price, and add to the cart only after the user confirms.
