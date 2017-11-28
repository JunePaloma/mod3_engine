require "rails_helper"

describe "Item Search API" do
  describe "GET #show" do
    it "returns a single item" do
       item = create(:item)
       get "/api/v1/items/find?name=#{item.name}"
       parsed_body = JSON.parse(response.body, symbolize_names: true)
       expect(parsed_body).to eq({id: item.id, name: item.name})
    end
  end
  describe "GET #index" do
    it "returns all items" do
       item = create(:item)
       get "/api/v1/items/find_all?name=#{item.name}"
       parsed_body = JSON.parse(response.body, symbolize_names: true)
       expect(parsed_body).to eq([{id: item.id, name: item.name}])
    end
  end
end
