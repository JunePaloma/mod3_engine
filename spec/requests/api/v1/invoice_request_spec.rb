require 'rails_helper'

describe "Invoices API" do
  it "displays a list of all the invoices" do
    create_list(:invoice, 3)
    get '/api/v1/invoices'
    invoices = JSON.parse(response.body)
    expect(response).to be_success
    expect(invoices.count).to eq(3)
  end
  it "can locate one invoice by id" do
    id = create(:invoice).id
    get "/api/v1/invoices/#{id}"
    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice["id"]).to eq(id)
  end
end
