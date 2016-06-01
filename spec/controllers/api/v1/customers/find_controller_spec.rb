require "rails_helper"

RSpec.describe Api::V1::Customers::FindController, type: :controller do
  describe "GET #index" do
    it "returns all customers found by a param" do
      customers = create_list(:customer, 2, first_name: "Josh")
      get :index, first_name: "josh", format: :json
      parsed_json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(parsed_json.count).to eq(2)
      expect(parsed_json.first.has_key?("first_name")).to be true
    end
  end

  describe "GET #show" do
    it "returns a single customer found by a param" do
      customers = create_list(:customer, 2, first_name: "Josh")
      get :show, first_name: "josh", format: :json
      parsed_json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(parsed_json.first.has_key?("first_name")).to be true
    end
  end
end
