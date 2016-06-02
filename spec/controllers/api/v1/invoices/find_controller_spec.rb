require "rails_helper"

RSpec.describe Api::V1::Invoices::FindController, type: :controller do
  describe "GET #index" do
    it "returns all invoices found by a param" do
      invoices = create_list(:invoice, 2, status: "Shipped")
      get :index, status: "shipped", format: :json
      parsed_json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(parsed_json.count).to eq(2)
      expect(parsed_json.first.key?("status")).to be true
    end
  end

  describe "GET #show" do
    it "returns a single invoice found by a param" do
      invoices = create_list(:invoice, 2, status: "shipped")
      get :show, status: "Shipped", format: :json
      parsed_json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(parsed_json.key?("status")).to be true
    end
  end
end
