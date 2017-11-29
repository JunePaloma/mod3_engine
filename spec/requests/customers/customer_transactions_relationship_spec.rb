require "rails_helper"

describe "Customer Transactions relationship API" do
  describe "GET #index" do
    it "returns a collection of transactions" do
       customer = create(:customer)
       transactions = create_list(:transcations, 2, customer: customer)
       get "/api/v1/customers/#{customer.id}/transactions"
       parsed_body = JSON.parse(response.body, symbolize_names: true)
       expect(parsed_body.count).to eq(2)
       expect(parsed_body).to eq({id: customer.transactions.first.id, result: customer.transactions.first.id, invoice_id: customer.transactions.first.invoice_id}, {id: customer.transactions.last.id, result: customer.transactions.last.id, invoice_id: customer.transactions.last.invoice_id})
    end
  end
end
