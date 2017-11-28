require 'rails_helper'

describe "Transaction API" do
  it "displays a list of all the transactions" do
    create_list(:transaction, 3)
    get '/api/v1/transactions'
    transactions = JSON.parse(response.body)
    expect(response).to be_success
    expect(transactions.count).to eq(3)
  end
  it "can locate one transcation by id" do
    id = create(:transaction).id
    get "/api/v1/transactions/#{id}"
    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction["id"]).to eq(id)
  end
end
