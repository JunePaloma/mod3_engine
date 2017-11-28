require 'rails_helper'

describe "Invoices Items API" do
  it "displays a list of all the invoice items" do
    create_list(:invoice_item, 3)
    get '/api/v1/invoice_items'
    invoice_items = JSON.parse(response.body)
    expect(response).to be_success
    expect(invoice_items.count).to eq(3)
  end
  it "can locate one invoice_item by id" do
    id = create(:invoice_item).id
    get "/api/v1/invoice_items/#{id}"
    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item["id"]).to eq(id)
  end
end
