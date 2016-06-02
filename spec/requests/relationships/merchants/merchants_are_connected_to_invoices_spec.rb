require "rails_helper"

RSpec.describe "GET /api/v1/merchants/:id/invoices" do
  it "returns invoices connected to given merchant" do
    merchant = create(:merchant)
    merchant_invoice = create(:invoice, merchant: merchant)
    create(:invoice)

    get "/api/v1/merchants/#{merchant.id}/invoices"
    parsed_json = JSON.parse(response.body)

    expect(response.status).to eq 200
    expect(parsed_json.count).to eq(1)
    expect(parsed_json.first["id"]).to eq(merchant_invoice.id)
  end
end
