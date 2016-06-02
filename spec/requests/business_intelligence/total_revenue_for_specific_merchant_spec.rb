require "rails_helper"

RSpec.describe "GET /api/v1/merchants/:id/revenue" do
  it "returns a merchants revenue for invoices with a successful transaction" do
    merchant = create(:merchant)
    invoice = create(:invoice, merchant: merchant)

    invoice.transactions << create(:transaction)
    invoice.invoice_items << create(:invoice_item, unit_price: 100, quantity: 1 )

    get "/api/v1/merchants/#{merchant.id}/revenue"
    parsed_json = JSON.parse(response.body)

    expect(response.status).to eq 200
    expect(parsed_json["revenue"]).to eq("1.0")
  end

  it "returns a merchants revenue for invoices on a specific date" do
    merchant = create(:merchant)
    invoice = create(:invoice, merchant: merchant, created_at: "2012-03-16 11:55:05")

    invoice.transactions << create(:transaction)
    invoice.invoice_items << create(:invoice_item, unit_price: 100, quantity: 1)

    get "/api/v1/merchants/#{merchant.id}/revenue?2012-03-16%2011:55:05"
    parsed_json = JSON.parse(response.body)

    expect(response.status).to eq 200
    expect(parsed_json["revenue"]).to eq "1.0"
end
end
