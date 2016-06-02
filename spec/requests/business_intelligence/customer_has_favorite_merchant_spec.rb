require "rails_helper"

RSpec.describe "GET /api/v1/customers/:id/favorite_merchant" do
  it "returns a customers favorite merchant by number of successful transactions" do
    customer = create(:customer)
    merchant1 = create(:merchant)
    merchant2 = create(:merchant)
    invoice1 = create(:invoice, customer: customer, merchant: merchant1)
    invoice2 = create(:invoice, customer: customer, merchant: merchant2)
    invoice1.transactions = [create(:transaction)]
    invoice2.transactions = [create(:transaction), create(:transaction)]

    get "/api/v1/customers/#{customer.id}/favorite_merchant"
    parsed_json = JSON.parse(response.body)

    expect(response.status).to eq 200
    expect(parsed_json["id"]).to eq(merchant2.id)
    expect(parsed_json["name"]).to eq(merchant2.name)
  end
end
