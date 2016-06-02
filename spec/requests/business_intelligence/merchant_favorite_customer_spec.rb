require "rails_helper"

RSpec.describe "GET /api/v1/merchants/:id/favorite_customer" do

  it "returns a merchants favorite customer by number of successful transactions" do
    merchant1 = create(:merchant)
    customer1 = create(:customer)
    customer2 = create(:customer)
    invoice1 = create(:invoice, customer: customer1, merchant: merchant1)
    invoice2 = create(:invoice, customer: customer2, merchant: merchant1)
    invoice1.transactions << create(:transaction, result: "failed")
    invoice2.transactions << create(:transaction)

    get "/api/v1/merchants/#{merchant1.id}/favorite_customer"
    parsed_json = JSON.parse(response.body)

    expect(response.status).to eq 200
    expect(parsed_json["id"]).to eq customer2.id
  end
end
