require "rails_helper"

RSpec.describe Api::V1::Transactions::FindController, type: :controller do
  describe "GET #index" do
    it "returns all transactions found by a param" do
      transactions = create_list(:transaction, 2, credit_card_number: "4242")
      get :index, credit_card_number: "4242", format: :json
      parsed_json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(parsed_json.count).to eq(2)
      expect(parsed_json.first.key?("credit_card_number")).to be true
    end
  end

  describe "GET #show" do
    it "returns a single transaction found by a param" do
      transactions = create_list(:transaction, 2, credit_card_number: "4242")
      get :show, credit_card_number: "4242", format: :json
      parsed_json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(parsed_json.key?("credit_card_number")).to be true
    end
  end
end
