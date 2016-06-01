require "rails_helper"

RSpec.describe Api::V1::InvoicesController, type: :controller do
  describe "GET #index" do
    it "returns all invoices" do
      invoices = create_list(:invoice, 2)
      get :index, format: :json
      parsed_json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(parsed_json.count).to eq(2)
      expect(parsed_json.first.has_key?("status")).to be true
    end
  end

  describe "GET #show" do
    it "returns a single invoice by id" do
      create_list(:invoice, 2)
      invoice = Invoice.last
      get :show, format: :json, id: invoice.id
      parsed_json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(parsed_json["id"]).to eq(invoice.id)
      expect(parsed_json["customer_id"]).to eq(invoice.customer_id)
      expect(parsed_json["merchant_id"]).to eq(invoice.merchant_id)
    end
  end
end
