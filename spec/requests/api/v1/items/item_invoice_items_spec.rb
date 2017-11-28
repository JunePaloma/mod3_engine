require "rails_helper"

describe "Item invoice items relationship API" do
  describe "GET #index" do
    it "returns invoice items for an item" do
       item = create(:item)
       invoice_items = create_list(:invoice_item, 2, item: item)
       get "/api/v1/items/#{item.id}/invoice_items"
       parsed_body = JSON.parse(response.body, symbolize_names: true)

       expect(response).to be_success
       expect(parsed_body.count).to eq(2)
       expect(parsed_body.first[:id]).to eq(invoice_items.first.id)
      #  expect(parsed_body).to eq("#{item.invoice_items}")
    end
  end
end
