require "rails_helper"

describe "Merchant Items relationship API" do
  describe "GET #index" do
    it "returns a collection of items associated with the merchant" do
      merchant = create(:merchant)
      items = create_list(:item, 2, merchant: merchant)
      get "/api/v1/merchants/#{merchant.id}/items"
      parsed_body = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_success
      expect(parsed_body.count).to eq(2)
      expect(parsed_body.first[:id]).to eq(items.first.id)
    end
  end
end
