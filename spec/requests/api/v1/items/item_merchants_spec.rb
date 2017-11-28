require "rails_helper"

describe "Item Merchants relationship API" do
  describe "GET #index" do
    it "returns a single merchant" do
       item = create(:item)
       get "/api/v1/items/#{item.id}/merchant"
       parsed_body = JSON.parse(response.body, symbolize_names: true)
       expect(parsed_body).to eq({id: item.merchant.id, name: item.merchant.name})
    end
  end
end
