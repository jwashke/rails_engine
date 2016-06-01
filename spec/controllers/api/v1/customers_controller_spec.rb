require "rails_helper"

RSpec.describe Api::V1::CustomersController, type: :controller do
  describe "GET #index" do
    it "returns all customers" do
      create_list(:customer, 2)
      get :index, format: :json
      parsed_json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(parsed_json.count).to eq(2)
      expect(parsed_json.first.key?("first_name")).to be true
    end
  end

  describe "GET #show" do
    it "returns a single customer by id" do
      create_list(:customer, 2)
      customer = Customer.last
      get :show, format: :json, id: customer.id
      parsed_json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(parsed_json["id"]).to eq(customer.id)
      expect(parsed_json["last_name"]).to eq(customer.last_name)
      expect(parsed_json["first_name"]).to eq(customer.first_name)
    end
  end
end
