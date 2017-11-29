require "rails_helper"

describe "InvoiceItem search API" do
  describe "GET #show" do
    it "returns a single merchant" do
      merchant = create(:merchant)
      get "/api/v1/merchants/find?name=#{merchant.name}"
      parsed_body = JSON.parse(response.body, symbolize_names: true)
      expect(parsed_body).to eq({id: merchant.id, name: merchant.name})
    end
  end
end
