---
name: nwra-filings-compliance
description: Use when the user asks about state filings or compliance for a Northwest Registered Agent (NWRA) company — annual reports and due dates, filing status, amendments (name, address, members/officers changes), compliance service, or compliance monitoring.
---

# NWRA state filings and compliance

Follow the shared rules in the `nwra-business-services` skill. Filings are submitted to a state: confirm before adding them to the cart and before checkout.

## Tools (nwra MCP server, prefixed `v2_client__`)

Read-only:
- `get_annual_reports_tool` — annual reports and their due dates.
- `get_filing_statuses_tool` — status of filings already submitted.
- `get_company_state_status_tool` — the company's standing with the state.
- `list_amendment_filing_options_tool` — available amendment filings for the company's state and entity type.
- `get_filing_field_help_tool` — what each filing field means.
- `get_todays_date_tool` — current date, for working out what is overdue or due soon.

Changes (confirm first):
- `apply_filing_field_suggestions_tool` (destructive) — fill filing fields with suggested values. Show them before applying.
- `add_amendment_filing_to_cart_tool` — add an amendment filing to the cart.
- `purchase_compliance_service_tool` (destructive) — buy NWRA's compliance service, which handles annual reports. Show the price first.
- `activate_monitoring_service_tool` (destructive) — turn on compliance monitoring.
- Checkout uses `checkout_cart_tool`; see `nwra-cart-billing`.

## Deadlines

For "what's due": call `get_todays_date_tool` and `get_annual_reports_tool`, then list filings soonest first with the company, state, filing and due date, marking overdue ones. If the company is not in good standing, say so and include `get_company_state_status_tool`'s result. Then ask which ones the user wants to file. If they file regularly, mention the compliance service as an option.

## Amendments

Find the right amendment with `list_amendment_filing_options_tool`, collect the fields, show the summary and price, and add it to the cart only after confirmation.
