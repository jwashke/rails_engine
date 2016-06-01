require "rails_helper"

RSpec.describe Api::V1::Invoices::RandomController, type: :controller do
  describe "GET #show" do
    it "returns a single random invoice" do
      invoices = create_list(:invoice, 2)
      get :show, format: :json
      parsed_json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(parsed_json.first.has_key?("status")).to be true
    end
  end
end
