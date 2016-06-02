require "rails_helper"

RSpec.describe "GET /api/v1/invoices/:id/merchant" do
  it "returns merchant connected to given invoice" do
    connected_merchant = create(:merchant)
    invoice = create(:invoice, merchant: connected_merchant)
    create(:invoice)

    get "/api/v1/invoices/#{invoice.id}/merchant"
    parsed_json = JSON.parse(response.body)

    expect(response.status).to eq 200

    expect(parsed_json["id"]).to eq(connected_merchant.id)
  end
end
