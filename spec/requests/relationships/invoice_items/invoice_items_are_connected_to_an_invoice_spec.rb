require "rails_helper"

RSpec.describe "GET /api/v1/invoice_items/:id/invoice" do
  it "returns invoice connected to given invoice item" do
    invoice = create(:invoice)
    create(:invoice)
    invoice_item = create(:invoice_item, invoice: invoice)

    get "/api/v1/invoice_items/#{invoice_item.id}/invoice"
    parsed_json = JSON.parse(response.body)

    expect(response.status).to eq 200
    expect(parsed_json["id"]).to eq(invoice.id)
  end
end
