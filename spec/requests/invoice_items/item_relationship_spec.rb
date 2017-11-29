require "rails_helper"

describe "InvoiceItem and Items relationship API" do
  describe "GET #index" do
    it "returns an associated item" do
       item = create(:item)
       ii = create(:invoice_item, item: item)
       get "/api/v1/invoice_items/#{ii.id}/item"
       parsed_body = JSON.parse(response.body, symbolize_names: true)
       expect(parsed_body).to eq({id: ii.item.id, name: ii.item.name, description: ii.item.description})
    end
  end
end
