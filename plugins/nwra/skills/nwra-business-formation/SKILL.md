---
name: nwra-business-formation
description: Use when the user wants to form a new business through Northwest Registered Agent (NWRA) — an LLC, corporation, nonprofit or other entity — or add an EIN, registered agent service, or a new company record to their account. Also covers choosing entity types and NAICS (industry) codes for a filing.
---

# NWRA business formation

Follow the shared rules in the `nwra-business-services` skill. Formation files with a state and costs money: confirm before adding it to the cart and again before checkout.

## Tools (nwra MCP server, prefixed `v2_client__`)

Read-only:
- `company_entity_catalog_tool` — entity types available, by state. Use it instead of assuming which types a state allows.
- `list_formation_filing_options_tool` — formation filing options for a state and entity type, with what each needs and costs.
- `list_ein_filing_options_tool` — EIN filing options.
- `search_naics_codes_tool` — look up an industry code from a description of the business.
- `get_filing_field_help_tool` — explains the fields a filing requires. Use it when the user asks what a field means.

Changes:
- `create_company_tool` — create the company record in the account (formation and EIN orders attach to it).
- `apply_filing_field_suggestions_tool` (destructive) — fill in filing fields with suggested values. Show the suggestions to the user before applying them.
- `add_formation_to_cart_tool` (destructive) — add the formation filing to the cart.
- `add_ein_to_cart_tool` — add an EIN filing to the cart.
- `add_ra_service_to_cart` (destructive) — add registered agent service to the cart.
- Checkout uses `checkout_cart_tool`; see `nwra-cart-billing`.

## Flow

1. Get the state, entity type and business name. Check entity types with `company_entity_catalog_tool`.
2. Pick the filing option with `list_formation_filing_options_tool` and collect every required field, using `get_filing_field_help_tool` to explain them. Find a NAICS code with `search_naics_codes_tool` if one is needed.
3. Offer the add-ons the user is likely to need: an EIN and registered agent service.
4. Show a summary (company, state, entity type, every field, each item and its price) and wait for confirmation.
5. Create the company if needed, add the items to the cart, show the cart, and only then check out after a second confirmation.

Don't recommend an entity type or state as legal or tax advice. Explain the general trade-offs and suggest an attorney or accountant.
