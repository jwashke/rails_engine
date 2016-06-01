require "rails_helper"

RSpec.describe Api::V1::ItemsController, type: :controller do
  describe "GET #index" do
    it "returns all items" do
      items = create_list(:item, 2)
      get :index, format: :json
      parsed_json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(parsed_json.count).to eq(2)
      expect(parsed_json.first.has_key?("description")).to be true
    end
  end

  describe "GET #show" do
    it "returns a single item by id" do
      create_list(:item, 2)
      item = Item.last
      get :show, format: :json, id: item.id
      parsed_json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(parsed_json["id"]).to eq(item.id)
      expect(parsed_json["name"]).to eq(item.name)
      expect(parsed_json["description"]).to eq(item.description)
    end
  end
end
