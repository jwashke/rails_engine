require "rails_helper"

RSpec.describe "GET /api/v1/merchants/:id/customers_with_pending_invoices" do

  it "returns customers who have at least one failed transaction" do
    merchant = create(:merchant)
    customer1 = create(:customer)
    customer2 = create(:customer)
    invoice1 = create(:invoice, customer: customer1, merchant: merchant)
    invoice2 = create(:invoice, customer: customer2, merchant: merchant)
    invoice1.transactions << create(:transaction, result: "failed")
    invoice2.transactions << create(:transaction)

    get "/api/v1/merchants/#{merchant.id}/customers_with_pending_invoices"
    parsed_json = JSON.parse(response.body)

    expect(response.status).to eq 200
    expect(parsed_json.first["id"]).to eq(customer1.id)
  end
end
