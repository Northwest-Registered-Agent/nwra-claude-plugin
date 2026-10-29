---
name: nwra-documents-mail
description: Use when the user asks about documents or mail Northwest Registered Agent (NWRA) received or holds for their company — reading or finding documents, unlocking a locked document, document plan upgrades, requesting official documents (e.g. certificates of good standing or certified copies), or mail forwarding/scanning plans and the shipping address.
---

# NWRA documents and mail

Follow the shared rules in the `nwra-business-services` skill.

## Tools (nwra MCP server, prefixed `v2_client__`)

Documents:
- `get_documents_tool` (read-only) — documents for the account or company. Start here.
- `get_document_details_tool` — metadata for one document.
- `get_document_content_tool` — the document's content. Summarise it for the user. Documents such as service of process can be time-sensitive: point out any deadlines in them.
- `create_document_unlock_invoice_tool` — creates an invoice to unlock a document the user's plan doesn't cover. It creates a charge, so confirm first.
- `get_document_plan_upgrade_options_tool` (read-only), `add_document_plan_upgrade_to_cart_tool` — upgrade the plan instead of paying per document. Compare the two options for the user when a document is locked.

Document requests (official copies from the state):
- `get_document_request_options_tool` (read-only) — what can be requested and the cost.
- `create_document_request_tool` (destructive) — place the request. Confirm the document type, company and price first.
- `get_document_request_status_tool` (read-only) — follow up on a request.

Mail:
- `get_mail_plans_tool`, `get_mail_service_plan_details_tool` (read-only) — available plans and the current plan.
- `add_mail_plan_to_cart_tool` — add a mail plan to the cart (checkout via `nwra-cart-billing`).
- `get_account_shipping_address_tool` (read-only) — where physical mail and documents are sent.
