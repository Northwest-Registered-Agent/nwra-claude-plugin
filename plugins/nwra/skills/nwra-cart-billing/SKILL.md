---
name: nwra-cart-billing
description: Use when the user wants to browse or buy Northwest Registered Agent (NWRA) products, review or change their cart, check out, or handle billing — invoices, paying an invoice, payment methods, autopay, refunds, or order details.
---

# NWRA products, cart and billing

Follow the shared rules in the `nwra-business-services` skill. Checkout and invoice payment charge the user's payment method: never call them without an explicit confirmation of the exact items and total.

## Tools (nwra MCP server, prefixed `v2_client__`)

Products (read-only):
- `discover_products_tool` — find products that fit what the user describes.
- `get_products_tool` — product catalog.
- `select_product_tool` — details for a chosen product, including what it needs before it can go in the cart.
- `get_service_field_help_tool` — what a product's or service's fields mean.

Cart:
- `get_cart_items_tool` (read-only) — current cart. Show it before checkout.
- `add_product_to_cart_tool` — add a general product. Area-specific tools exist for formations, amendments, EINs, registered agent service, domains, email, phone, mail plans, document upgrades and vehicle registration; prefer those for their products.
- `apply_service_field_suggestions_tool` (destructive) — fill service fields with suggested values. Show them before applying.
- `remove_from_cart_tool` (destructive) — remove an item.
- `checkout_cart_tool` (destructive) — place the order and charge the account.

Billing:
- `get_invoices_tool`, `get_order_details_tool`, `get_refund_status_tool`, `get_payment_methods_tool` (read-only).
- `pay_invoice_tool` (destructive) — pay an invoice.
- `enable_autopay_tool` (destructive) — turn on autopay.

## Checkout

1. `get_cart_items_tool` and show every item, its company, and the total.
2. If there are items in the cart the user didn't add in this conversation, point them out and ask whether to keep them.
3. Confirm the payment method (`get_payment_methods_tool`) if there is more than one.
4. Check out only after the user confirms, then report the order reference and status. Use `get_order_details_tool` if they want to follow up.
