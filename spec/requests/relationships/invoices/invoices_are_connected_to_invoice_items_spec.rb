require "rails_helper"

RSpec.describe "GET /api/v1/invoices/:id/invoice_items" do
  it "returns invoice items connected to given invoice" do
    invoice = create(:invoice)
    invoice_item = create(:invoice_item, invoice: invoice)
    create(:invoice_item)

    get "/api/v1/invoices/#{invoice.id}/invoice_items"
    parsed_json = JSON.parse(response.body)

    expect(response.status).to eq 200
    expect(parsed_json.count).to eq(1)
    expect(parsed_json.first["id"]).to eq(invoice_item.id)
  end
end
