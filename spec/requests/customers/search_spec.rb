require "rails_helper"

describe "Customer search API" do
  describe "GET #show" do
    it "returns a single customer" do
      customer = create(:customer)
      create_list(:customer, 2)
      get "/api/v1/customers/find?id=#{customer.id}"
      parsed_body = JSON.parse(response.body, symbolize_names: true)
      expect(parsed_body).to eq({id: customer.id, first_name: customer.first_name, last_name: customer.last_name})
      expect(parsed_body.count).to eq(3)
    end
  end
  describe "GET #index" do
    it "returns all customers" do
       customer = create(:customer)
       customer2 = create(:customer)
       get "/api/v1/customers/find_all?last_name=#{customer.last_name}"
       parsed_body = JSON.parse(response.body, symbolize_names: true)
       expect(parsed_body.count).to eq(2)
       expect(parsed_body).to eq([{id: customer.id, first_name: customer.first_name, last_name: customer.last_name }, {id: customer2.id, first_name: customer2.first_name, last_name: customer2.last_name}])
    end
  end
end
