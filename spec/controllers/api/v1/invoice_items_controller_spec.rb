require "rails_helper"

RSpec.describe Api::V1::InvoiceItemsController, type: :controller do
  describe "GET #index" do
    it "returns all invoice items" do
      invoice_items = create_list(:invoice_item, 2)
      get :index, format: :json
      parsed_json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(parsed_json.count).to eq(2)
      expect(parsed_json.first.has_key?("invoice_id")).to be true
    end
  end

  describe "GET #show" do
    it "returns a single invoice item by id" do
      create_list(:invoice_item, 2)
      invoice_item = InvoiceItem.last
      get :show, format: :json, id: invoice_item.id
      parsed_json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(parsed_json["id"]).to eq(invoice_item.id)
      expect(parsed_json["invoice_id"]).to eq(invoice_item.invoice_id)
      expect(parsed_json["item_id"]).to eq(invoice_item.item_id)
    end
  end
end
