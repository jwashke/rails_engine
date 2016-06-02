require "rails_helper"

RSpec.describe "GET /api/v1/invoices/:id/transactions" do
  it "returns transactions connected to given invoice" do
    invoice = create(:invoice)
    invoice_transaction = create(:transaction, invoice: invoice)
    create(:transaction)

    get "/api/v1/invoices/#{invoice.id}/transactions"
    parsed_json = JSON.parse(response.body)

    expect(response.status).to eq 200
    expect(parsed_json.count).to eq(1)
    expect(parsed_json.first["id"]).to eq(invoice_transaction.id)
  end
end
