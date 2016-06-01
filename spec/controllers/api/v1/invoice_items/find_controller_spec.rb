require "rails_helper"

RSpec.describe Api::V1::InvoiceItems::FindController, type: :controller do
  describe "GET #index" do
    it "returns all invoice_items found by a param" do
      create_list(:invoice_item, 2, unit_price: 100)
      get :index, unit_price: 100, format: :json
      parsed_json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(parsed_json.count).to eq(2)
      expect(parsed_json.first.key?("unit_price")).to be true
    end
  end

  describe "GET #show" do
    it "returns a single invoice_item found by a param" do
      create_list(:invoice_item, 2, unit_price: 100)
      get :show, unit_price: 100, format: :json
      parsed_json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(parsed_json.first.key?("unit_price")).to be true
    end
  end
end
