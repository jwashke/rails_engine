require "rails_helper"

RSpec.describe "GET /api/v1/items/:id/best_day" do
  it "returns the top x items ranked by revenue" do
    item    = create(:item)
    invoice = create(:invoice, created_at: "2016-06-02T19:49:34.000Z")
    invoice.transactions << create(:transaction, result: "success")
    create(:invoice_item, item: item, invoice: invoice, quantity: 2 )

    get "/api/v1/items/#{item.id}/best_day"
    parsed_json = JSON.parse(response.body)

    expect(response.status).to eq 200

    expect(parsed_json["best_day"]).to eq("2016-06-02T19:49:34.000Z")
  end
end
