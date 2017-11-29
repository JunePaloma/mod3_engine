require "rails_helper"

describe "Merchant Invoice relationship API" do
  describe "GET #index" do
    it "returns a collection of invoices associated with the merchant" do
      merchant = create(:merchant)
      invoices = create_list(:invoice, 2, merchant: merchant)
      get "/api/v1/merchants/#{merchant.id}/invoices"
      parsed_body = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_success
      expect(parsed_body.count).to eq(2)
      expect(parsed_body.first[:id]).to eq(invoices.first.id)
    end
  end
end
