# GET /api/v1/merchants/most_revenue?quantity=x

require "rails_helper"

RSpec.describe "GET /api/v1/merchants/most_revneue?quantity=x" do
  it "returns the top x items ranked by revenue" do
    merchant1 = create(:merchant)
    merchant2 = create(:merchant)
    customer = create(:customer)
    invoice1 = create(:invoice, customer: customer, merchant: merchant1)
    invoice2 = create(:invoice, customer: customer, merchant: merchant1)
    invoice3 = create(:invoice, customer: customer, merchant: merchant2)

    invoice1.transactions << create(:transaction)
    invoice2.transactions << create(:transaction)
    invoice3.transactions << create(:transaction)
    invoice1.invoice_items << create(:invoice_item)
    invoice2.invoice_items << create(:invoice_item)
    invoice3.invoice_items << create(:invoice_item)

    get "/api/v1/merchants/most_revenue?quantity=1"
    parsed_json = JSON.parse(response.body)

    expect(response.status).to eq 200

    expect(parsed_json.first["id"]).to eq(merchant1.id)
    expect(parsed_json.first["name"]).to eq(merchant1.name)
  end
end
