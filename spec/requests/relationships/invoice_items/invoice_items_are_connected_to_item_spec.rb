require "rails_helper"

RSpec.describe "GET /api/v1/invoice_items/:id/item" do
  it "returns item connected to given invoice item" do
    item = create(:item)
    create(:item)
    invoice_item = create(:invoice_item, item: item)

    get "/api/v1/invoice_items/#{invoice_item.id}/item"
    parsed_json = JSON.parse(response.body)

    expect(response.status).to eq 200
    expect(parsed_json["id"]).to eq(item.id)
  end
end
