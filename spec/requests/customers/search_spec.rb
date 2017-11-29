require "rails_helper"

describe "Customer search API" do
  describe "GET #show" do
    it "returns a single customer" do
      customer = create(:customer)
      get "/api/v1/customers/find?last_name=#{customer.last_name}"
      parsed_body = JSON.parse(response.body, symbolize_names: true)
      expect(parsed_body).to eq({id: customer.id, first_name: customer.first_name, last_name: customer.last_name})
    end
  end
  describe "GET #index" do
    it "returns all customers" do
       customer = create(:customer)
       get "/api/v1/customers/find_all?id=#{customer.id}"
       parsed_body = JSON.parse(response.body, symbolize_names: true)
       expect(parsed_body).to eq([{id: customer.id, first_name: customer.first_name, last_name: customer.last_name }])
    end
  end
end
