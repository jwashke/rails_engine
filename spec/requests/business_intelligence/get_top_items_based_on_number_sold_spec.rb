require "rails_helper"

RSpec.describe "GET /api/v1/items/most_items?quantity=x" do
  it "returns the top x items ranked by revenue" do
    item1     = create(:item)
    item2     = create(:item)
    invoice1  = create(:invoice)
    invoice2  = create(:invoice)
    invoice3  = create(:invoice)

    invoice1.transactions << create(:transaction)
    invoice2.transactions << create(:transaction)
    invoice3.transactions << create(:transaction)
    invoice1.invoice_items << create(:invoice_item, item: item1)
    invoice2.invoice_items << create(:invoice_item, item: item1)
    invoice3.invoice_items << create(:invoice_item, item: item2)

    get "/api/v1/items/most_items?quantity=1"
    parsed_json = JSON.parse(response.body)

    expect(response.status).to eq 200

    expect(parsed_json.first["id"]).to eq(item1.id)
    expect(parsed_json.first["name"]).to eq(item1.name)
  end
end
