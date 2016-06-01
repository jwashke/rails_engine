require "rails_helper"

RSpec.describe Api::V1::InvoiceItems::RandomController, type: :controller do
  describe "GET #show" do
    it "returns a single random invoice_item" do
      invoice_items = create_list(:invoice_item, 2)
      get :show, format: :json
      parsed_json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(parsed_json.first.has_key?("unit_price")).to be true
    end
  end
end
