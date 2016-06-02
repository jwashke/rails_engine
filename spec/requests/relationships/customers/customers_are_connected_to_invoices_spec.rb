require "rails_helper"

RSpec.describe "GET /api/v1/customers/:id/invoices" do
  it "returns invoices connected to given customer" do
    customer = create(:customer)
    invoice = create(:invoice, customer: customer)
    create(:invoice)

    get "/api/v1/customers/#{customer.id}/invoices"
    parsed_json = JSON.parse(response.body)

    expect(response.status).to eq 200
    expect(parsed_json.count).to eq(1)
    expect(parsed_json.first["id"]).to eq(invoice.id)
  end
end
