require "rails_helper"

RSpec.describe Api::V1::Merchants::FindController, type: :controller do
  describe "GET #index" do
    it "returns all merchants found by a param" do
      merchants = create_list(:merchant, 2, name: "Josh")
      get :index, name: "josh", format: :json
      parsed_json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(parsed_json.count).to eq(2)
      expect(parsed_json.first.key?("name")).to be true
    end
  end

  describe "GET #show" do
    it "returns a single merchant found by a param" do
      merchants = create_list(:merchant, 2, name: "Josh")
      get :show, name: "josh", format: :json
      parsed_json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(parsed_json.key?("name")).to be true
    end
  end
end
