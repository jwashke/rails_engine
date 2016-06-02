require "rails_helper"

RSpec.describe "GET /api/v1/merchants/revenue?date=x" do
  it "returns the total revenue for a given date" do
    invoice = create(:invoice, created_at: "2012-03-16 11:55:05")
    invoice.invoice_items << create(:invoice_item, unit_price: 100, quantity: 1)
    invoice.transactions << create(:transaction, result: "success")

    get "/api/v1/merchants/revenue?date=2012-03-16 11:55:05"
    parsed_json = JSON.parse(response.body)

    expect(response.status).to eq 200

    expect(parsed_json["total_revenue"]).to eq("1.0")
  end
end
