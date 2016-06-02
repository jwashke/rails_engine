require "rails_helper"

RSpec.describe "GET /api/v1/invoices/:id/customer" do
  it "returns items connected to given invoice" do
    connected_customer = create(:customer)
    invoice = create(:invoice, customer: connected_customer)
    create(:invoice)

    get "/api/v1/invoices/#{invoice.id}/customer"
    parsed_json = JSON.parse(response.body)

    expect(response.status).to eq 200

    expect(parsed_json["id"]).to eq(connected_customer.id)
  end
end
