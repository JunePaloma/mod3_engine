require 'rails_helper'

describe "Customer API" do
  it "displays a list of all the customers" do
    create_list(:customer, 3)
    get '/api/v1/customers'
    customers = JSON.parse(response.body)
    expect(response).to be_success
    expect(customers.count).to eq(3)
  end
  it "can locate one merchant by id" do
    id = create(:customer).id
    get "/api/v1/customers/#{id}"
    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer["id"]).to eq(id)
  end
end
