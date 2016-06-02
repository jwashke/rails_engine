require "rails_helper"

RSpec.describe "GET /api/v1/invoices/:id/items" do
  it "returns items connected to given invoice" do
    invoice = create(:invoice)
    connected_item = create(:item)
    create(:invoice_item, item: connected_item, invoice: invoice)
    create(:item)

    get "/api/v1/invoices/#{invoice.id}/items"
    parsed_json = JSON.parse(response.body)

    expect(response.status).to eq 200
    expect(parsed_json.count).to eq(1)
    expect(parsed_json.first["id"]).to eq(connected_item.id)
  end
end
