require 'rails_helper'

describe "Items API" do
  it "displays a list of all the items" do
    create_list(:item, 3)
    get '/api/v1/items'
    items = JSON.parse(response.body)
    expect(response).to be_success
    expect(items.count).to eq(3)
  end
  it "can locate one item by id" do
    id = create(:item).id
    get "/api/v1/items/#{id}"
    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item["id"]).to eq(id)
  end
end
