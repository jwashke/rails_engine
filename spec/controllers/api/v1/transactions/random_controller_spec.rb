require "rails_helper"

RSpec.describe Api::V1::Transactions::RandomController, type: :controller do
  describe "GET #show" do
    it "returns a single random transaction" do
      transactions = create_list(:transaction, 2)
      get :show, format: :json
      parsed_json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(parsed_json.first.has_key?("credit_card_number")).to be true
    end
  end
end
