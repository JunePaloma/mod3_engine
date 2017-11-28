require 'rails_helper'

describe "Merchants API" do
  it "is wired together properly" do
    create_list(:merchant, 3)
    get '/api/v1/merchants'
    expect(response).to be_success
  end
  it "displays a list of all the merchants" do
    create_list(:merchant, 3)
    get '/api/v1/merchants'
    merchants = JSON.parse(response.body)
    expect(merchants.count).to eq(3)
  end
end
