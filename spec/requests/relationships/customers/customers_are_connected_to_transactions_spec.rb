require "rails_helper"

RSpec.describe "GET /api/v1/customers/:id/transactions" do
  it "returns transactions connected to given customer" do
    customer = create(:customer)
    invoice = create(:invoice, customer: customer)
    transaction = create(:transaction, invoice: invoice)
    create(:transaction)

    get "/api/v1/customers/#{customer.id}/transactions"
    parsed_json = JSON.parse(response.body)

    expect(response.status).to eq 200
    expect(parsed_json.count).to eq(1)
    expect(parsed_json.first["id"]).to eq(transaction.id)
  end
end
