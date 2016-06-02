require "rails_helper"

RSpec.describe "GET /api/v1/transactions/:id/invoice" do
  it "returns invoice connected to given transaction" do
    invoice = create(:invoice)
    create(:invoice)
    transaction = create(:transaction, invoice: invoice)

    get "/api/v1/transactions/#{transaction.id}/invoice"
    parsed_json = JSON.parse(response.body)

    expect(response.status).to eq 200
    expect(parsed_json["id"]).to eq(invoice.id)
  end
end
