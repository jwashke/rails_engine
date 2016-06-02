require "rails_helper"

RSpec.describe "GET /api/v1/item/:id/merchant" do
  it "returns merchant connected to given item" do
    merchant = create(:merchant)
    create(:merchant)
    item = create(:item, merchant: merchant)

    get "/api/v1/items/#{item.id}/merchant"
    parsed_json = JSON.parse(response.body)

    expect(response.status).to eq 200
    expect(parsed_json["id"]).to eq(merchant.id)
  end
end
