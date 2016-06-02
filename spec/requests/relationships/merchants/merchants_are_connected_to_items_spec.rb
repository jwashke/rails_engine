require "rails_helper"

RSpec.describe "GET /api/v1/merchants/:id/items" do
  it "returns items connected to the given merchant" do
    merchant = create(:merchant)
    merchant_item = create(:item, merchant: merchant)
    create(:item)

    get "/api/v1/merchants/#{merchant.id}/items"
    parsed_json = JSON.parse(response.body)

    expect(response.status).to eq 200
    expect(parsed_json.count).to eq(1)
    expect(parsed_json.first["id"]).to eq(merchant_item.id)
  end
end
