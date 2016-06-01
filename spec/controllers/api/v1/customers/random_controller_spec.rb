require "rails_helper"

RSpec.describe Api::V1::Customers::RandomController, type: :controller do
  describe "GET #show" do
    it "returns a single random customer" do
      customers = create_list(:customer, 2, first_name: "Josh")
      get :show, format: :json
      parsed_json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(parsed_json.first.has_key?("first_name")).to be true
    end
  end
end
