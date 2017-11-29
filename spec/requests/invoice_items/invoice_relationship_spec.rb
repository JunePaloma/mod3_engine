require "rails_helper"

describe "InvoiceItem and Invoices relationship API" do
  describe "GET #index" do
    it "returns an associated invoice" do
       invoice = create(:invoice)
       ii = create(:invoice_item, invoice: invoice)
       get "/api/v1/invoice_items/#{ii.id}/invoice"
       parsed_body = JSON.parse(response.body, symbolize_names: true)
       expect(parsed_body).to eq({id: ii.invoice.id, customer_id: ii.invoice.customer_id, status: ii.invoice.status, merchant_id: ii.invoice.merchant_id})
    end
  end
end
