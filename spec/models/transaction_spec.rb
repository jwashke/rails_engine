require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:invoice_id) }
    it { is_expected.to validate_presence_of(:credit_card_number) }
    it { is_expected.to validate_presence_of(:result) }
  end

  describe "associations" do
    it { is_expected.to belong_to(:invoice) }
  end

  describe ".find_one_by" do
    it "can find a record by invoice id" do
      transaction = create(:transaction)
      found_transaction = Transaction.find_one_by(invoice_id: transaction.invoice_id).first

      expect(found_transaction).to eq(transaction)
    end

    it "can find a record by credit card number" do
      transaction = create(:transaction)
      found_transaction = Transaction.find_one_by(credit_card_number: transaction.credit_card_number).first

      expect(found_transaction).to eq(transaction)
    end

    it "can find a record by result" do
      transaction = create(:transaction)
      found_transaction = Transaction.find_one_by(result: transaction.result).first

      expect(found_transaction).to eq(transaction)
    end

    it "can find a record by created at" do
      transaction = create(:transaction)
      found_transaction = Transaction.find_one_by(created_at: transaction.created_at).first

      expect(found_transaction).to eq(transaction)
    end

    it "can find a record by updated at" do
      transaction = create(:transaction)
      found_transaction = Transaction.find_one_by(updated_at: transaction.updated_at).first

      expect(found_transaction).to eq(transaction)
    end
  end

  describe ".find_all_by" do
    it "can find all records by invoice id" do
      transaction_one = create(:transaction)
      transaction_two = create(:transaction, invoice_id: transaction_one.invoice_id)
      found_transactions = Transaction.find_all_by(invoice_id: transaction_one.invoice_id)

      expect(found_transactions).to include(transaction_one)
      expect(found_transactions).to include(transaction_two)
    end

    it "can find a record by credit card number" do
      transaction_one = create(:transaction)
      transaction_two = create(:transaction, credit_card_number: transaction_one.credit_card_number)
      found_transactions = Transaction.find_all_by(credit_card_number: transaction_one.credit_card_number)

      expect(found_transactions).to include(transaction_one)
      expect(found_transactions).to include(transaction_two)
    end

    it "can find a record by result" do
      transaction_one = create(:transaction)
      transaction_two = create(:transaction, result: transaction_one.result)
      found_transactions = Transaction.find_all_by(result: transaction_one.result)

      expect(found_transactions).to include(transaction_one)
      expect(found_transactions).to include(transaction_two)
    end

    it "can find a record by created at" do
      transaction_one = create(:transaction)
      transaction_two = create(:transaction, created_at: transaction_one.created_at)
      found_transactions = Transaction.find_all_by(created_at: transaction_one.created_at)

      expect(found_transactions).to include(transaction_one)
      expect(found_transactions).to include(transaction_two)
    end

    it "can find a record by updated at" do
      transaction_one = create(:transaction)
      transaction_two = create(:transaction, updated_at: transaction_one.updated_at)
      found_transactions = Transaction.find_all_by(updated_at: transaction_one.updated_at)

      expect(found_transactions).to include(transaction_one)
      expect(found_transactions).to include(transaction_two)
    end
  end

  describe ".random" do
    it "returns a single record" do
      create_list(:transaction, 2)
      found_transaction = Transaction.random

      expect(found_transaction.count).to eq(1)
      expect(found_transaction.first.class).to eq(Transaction)
    end
  end

  describe ".string_params?" do
    it "returns true if params result is present" do
      result = Transaction.string_params?(result: "success")

      expect(result).to be_truthy
    end

    it "returns true if params credit card number is present" do
      result = Transaction.string_params?(credit_card_number: "12345")

      expect(result).to be_truthy
    end

    it "returns false if neither are present" do
      result = Transaction.string_params?(created_at: Time.now)

      expect(result).not_to be_truthy
    end
  end
end
