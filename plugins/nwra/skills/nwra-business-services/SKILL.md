---
name: nwra-business-services
description: Use when the user wants to form or manage a business through Northwest Registered Agent (NWRA) — forming an LLC or corporation, registered agent service, annual reports and other state filings, compliance deadlines, or setting up a business domain, email, or phone number. Also use when they ask about the status of an existing NWRA company, order, or filing.
---

# Northwest Registered Agent business services

The `nwra` MCP server connects to the user's Northwest Registered Agent account. Use its tools for anything that reads or changes account data, and never guess at account details, filing status, prices, or state requirements: look them up through the tools.

## Before acting

- If the NWRA tools are not available or return an authentication error, tell the user to run `/mcp`, select `plugin:nwra:nwra`, and sign in with their Northwest account.
- Start by finding out which company the request is about. If the account has more than one, ask the user which one rather than picking.

## Orders, filings and purchases

Anything that files with a state, places an order, or charges the user's account is a real legal or financial action.

1. Gather every required detail first (state, entity type, names, addresses, members/officers, etc.), asking the user for anything you can't look up.
2. Show the user a summary of exactly what will be submitted and any cost the tools report.
3. Submit only after the user explicitly confirms. Don't treat earlier approval of a different action as confirmation.
4. Report back the order or filing reference and its status as returned by the tool.

## Tools

The server's tools are prefixed `v2_client__`. Tools marked destructive by the server, plus any tool that adds to the cart, creates a record or charges the account, need the confirmation steps above. Most purchases go into the cart first and are only charged at `checkout_cart_tool`.

## Typical requests

Each area has its own skill with the tools and steps for it:

- **Account and companies** (`nwra-account-companies`): overview, company details and state standing, action items, services, cancelling a service.
- **Forming a business** (`nwra-business-formation`): entity types, formation filing, EIN, registered agent service.
- **State filings and compliance** (`nwra-filings-compliance`): annual reports and due dates, filing status, amendments, compliance service.
- **Cart and billing** (`nwra-cart-billing`): products, cart, checkout, invoices, payment methods, refunds.
- **Documents and mail** (`nwra-documents-mail`): received documents, unlocking documents, official document requests, mail plans.
- **Domains** (`nwra-domains`): search, purchase, DNS, nameservers, forwarding, privacy and lock.
- **Email** (`nwra-email`): email hosting, inboxes, client settings, forwarding. A domain usually comes first.
- **Phone** (`nwra-phone`): numbers, call forwarding, voicemail, caller ID.
- **Vehicle registration** (`nwra-vehicle-registration`).

Don't give legal or tax advice. When a choice has legal or tax consequences (entity type, state of formation, tax elections), explain the trade-offs in general terms and suggest the user check with an attorney or accountant.
