require "rails_helper"

RSpec.describe Api::V1::Items::FindController, type: :controller do
  describe "GET #index" do
    it "returns all items found by a param" do
      items = create_list(:item, 2, name: "Josh")
      get :index, name: "josh", format: :json
      parsed_json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(parsed_json.count).to eq(2)
      expect(parsed_json.first.has_key?("name")).to be true
    end
  end

  describe "GET #show" do
    it "returns a single item found by a param" do
      items = create_list(:item, 2, name: "Josh")
      get :show, name: "josh", format: :json
      parsed_json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(parsed_json.first.has_key?("name")).to be true
    end
  end
end
