require "rails_helper"

describe "InvoiceItem search API" do
  describe "GET #show" do
    it "returns a single invoice item" do
      ii = create(:invoice_item)
      get "/api/v1/invoice_items/find?id=#{ii.id}"
      parsed_body = JSON.parse(response.body, symbolize_names: true)
      expect(parsed_body).to eq({id: ii.id, quantity: ii.quantity, unit_price: ii.unit_price, invoice_id: ii.invoice_id, item_id: ii.item_id})
    end
  end
  describe "GET #index" do
    it "returns all invoice_items" do
       ii = create(:invoice_item)
       get "/api/v1/invoice_items/find_all?id=#{ii.id}"
       parsed_body = JSON.parse(response.body, symbolize_names: true)
       expect(parsed_body).to eq([{id: ii.id, quantity: ii.quantity, unit_price: ii.unit_price, invoice_id: ii.invoice_id, item_id: ii.item_id}])
    end
  end
end
