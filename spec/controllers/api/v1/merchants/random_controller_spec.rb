require "rails_helper"

RSpec.describe Api::V1::Merchants::RandomController, type: :controller do
  describe "GET #show" do
    it "returns a single random merchant" do
      merchants = create_list(:merchant, 2, name: "Josh")
      get :show, format: :json
      parsed_json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(parsed_json.first.has_key?("name")).to be true
    end
  end
end
