require "rails_helper"

RSpec.describe Api::V1::MerchantsController, type: :controller do
  describe "GET #index" do
    it "returns all merchants" do
      merchants = create_list(:merchant, 2)
      get :index, format: :json
      parsed_json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(parsed_json.count).to eq(2)
      expect(parsed_json.first.has_key?("name")).to be true
    end
  end

  describe "GET #show" do
    it "returns a single merchant by id" do
      create_list(:merchant, 2)
      merchant = Merchant.last
      get :show, format: :json, id: merchant.id
      parsed_json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(parsed_json["id"]).to eq(merchant.id)
      expect(parsed_json["name"]).to eq(merchant.name)
    end
  end
end
