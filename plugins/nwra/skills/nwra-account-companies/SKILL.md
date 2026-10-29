---
name: nwra-account-companies
description: Use when the user asks about their Northwest Registered Agent (NWRA) account or companies — account overview, list of companies, company details or state standing, EIN, registered agent addresses, active services, action items needing attention, company signatures, renaming or updating a company, or cancelling a service.
---

# NWRA account and companies

Follow the shared rules in the `nwra-business-services` skill (sign-in, picking the company, confirming before changes).

## Tools (nwra MCP server, prefixed `v2_client__`)

Read-only:
- `get_account_summary_tool` — account-level overview. Good first call for "how's my account".
- `get_companies_tool` — the companies on the account. Use it to resolve which company the user means.
- `get_company_details_tool` — details for one company.
- `get_company_state_status_tool` — the company's standing with the state.
- `get_company_ein_tool` — the company's EIN, if NWRA has it on file.
- `get_registered_agents_tool` — registered agent service and addresses for the company.
- `get_services_tool`, `get_service_status_tool` — services on the account and the status of one.
- `get_action_items_tool`, `get_oi_req_attention` — items that need the user's attention. Check both when the user asks "what do I need to do?".
- `list_company_signatures_tool` — saved signatures for the company.
- `get_site_contact_information_tool` — NWRA's own contact details, for when the user needs to reach support.
- `get_todays_date_tool` — the server's current date. Use it when working out how soon something is due.

Changes (confirm first):
- `update_company_details_tool` — update company information. Show the old and new values.
- `update_company_name_tool` — rename the company in the account. Ask whether they also need a state amendment to change the legal name (see `nwra-filings-compliance`); renaming here may not change the name on file with the state.
- `delete_company_signature_tool` — remove a saved signature.
- `cancel_service_tool` — cancel a service. Before calling it, show which service and company, and warn about consequences: cancelling registered agent service can leave the company without a required registered agent in that state.

## Status overview

For "what's going on with my account": `get_account_summary_tool`, `get_companies_tool`, then `get_action_items_tool` and `get_oi_req_attention`. Keep the answer short: companies, anything in progress, and what needs action, soonest first.
