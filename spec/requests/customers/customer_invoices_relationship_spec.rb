require "rails_helper"

describe "Customer Invoices relationship API" do
  describe "GET #index" do
    it "returns a collection of invoices" do
       customer = create(:customer)
       invoices = create_list(:invoice, 2, customer: customer)

       get "/api/v1/customers/#{customer.id}/invoices"
       parsed_body = JSON.parse(response.body, symbolize_names: true)

       expect(parsed_body.count).to eq(2)
       expect(parsed_body).to eq([{id: customer.invoices.first.id, customer_id: customer.invoices.first.customer_id, merchant_id: customer.invoices.first.merchant_id, status: customer.invoices.first.status}, {id: customer.invoices.last.id, customer_id: customer.invoices.last.customer_id, merchant_id: customer.invoices.last.merchant_id, status: customer.invoices.last.status}])
    end
  end
end
