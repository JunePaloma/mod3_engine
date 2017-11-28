require 'rails_helper'

describe "Merchants API" do
  it "displays a list of all the merchants" do
    create_list(:merchant, 3)

    get '/api/v1/merchants'

    expect(response).to be_success
  end
end 
