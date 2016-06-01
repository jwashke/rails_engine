require "rails_helper"

RSpec.describe Api::V1::Items::RandomController, type: :controller do
  describe "GET #show" do
    it "returns a single random item" do
      items = create_list(:item, 2)
      get :show, format: :json
      parsed_json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(parsed_json.first.has_key?("name")).to be true
    end
  end
end
