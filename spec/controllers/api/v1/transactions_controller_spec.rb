require "rails_helper"

RSpec.describe Api::V1::TransactionsController, type: :controller do
  describe "GET #index" do
    it "returns all transactions" do
      transactions = create_list(:transaction, 2)
      get :index, format: :json
      parsed_json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(parsed_json.count).to eq(2)
      expect(parsed_json.first.has_key?("credit_card_number")).to be true
    end
  end

  describe "GET #show" do
    it "returns a single transaction by id" do
      create_list(:transaction, 2)
      transaction = Transaction.last
      get :show, format: :json, id: transaction.id
      parsed_json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(parsed_json["id"]).to eq(transaction.id)
      expect(parsed_json["credit_card_number"]).to eq(transaction.credit_card_number)
      expect(parsed_json["invoice_id"]).to eq(transaction.invoice_id)
    end
  end
end
