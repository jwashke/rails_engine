require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe ".find_one_by" do
    it "can find a record by name" do
      merchant = create(:merchant)
      found_merchant = Merchant.find_one_by(name: merchant.name)

      expect(found_merchant).to eq(merchant)
    end

    it "can find by first name case insensitive" do
      merchant = create(:merchant)
      found_merchant = Merchant.find_one_by(name: merchant.name.upcase)

      expect(found_merchant).to eq(merchant)
    end

    it "can find by created at" do
      merchant = create(:merchant)
      found_merchant = Merchant.find_one_by(created_at: merchant.created_at)

      expect(found_merchant).to eq(merchant)
    end

    it "can find by updated at" do
      merchant = create(:merchant)
      found_merchant = Merchant.find_one_by(updated_at: merchant.updated_at)

      expect(found_merchant).to eq(merchant)
    end
  end

  describe ".find_all_by" do
    it "can find all by name" do
      merchant_one = create(:merchant, name: "name")
      merchant_two = create(:merchant, name: "name")
      found_merchants = Merchant.find_all_by(name: merchant_one.name)

      expect(found_merchants).to include(merchant_one)
      expect(found_merchants).to include(merchant_two)
    end

    it "can find all by name case insensitive" do
      merchant_one = create(:merchant, name: "name")
      merchant_two = create(:merchant, name: "name")
      found_merchants = Merchant.find_all_by(name: merchant_one.name.upcase)

      expect(found_merchants).to include(merchant_one)
      expect(found_merchants).to include(merchant_two)
    end

    it "can find all by created at" do
      time = Time.now
      merchant_one = create(:merchant, created_at: time)
      merchant_two = create(:merchant, created_at: time)
      found_merchants = Merchant.find_all_by(created_at: time)

      expect(found_merchants).to include(merchant_one)
      expect(found_merchants).to include(merchant_two)
    end

    it "can find all by updated at" do
      time = Time.now
      merchant_one = create(:merchant, updated_at: time)
      merchant_two = create(:merchant, updated_at: time)
      found_merchants = Merchant.find_all_by(updated_at: time)

      expect(found_merchants).to include(merchant_one)
      expect(found_merchants).to include(merchant_two)
    end
  end

  describe ".random" do
    it "returns a single record" do
      create_list(:merchant, 2)
      found_merchant = Merchant.random

      expect(found_merchant.count).to eq(1)
      expect(found_merchant.first.class).to eq(Merchant)
    end
  end

  describe ".string_params?" do
    it "returns true if params name name is present" do
      result = Merchant.string_params?(name: "name")

      expect(result).to be_truthy
    end

    it "returns false if it is not present" do
      result = Merchant.string_params?(created_at: Time.now)

      expect(result).not_to be_truthy
    end
  end

  describe ".ranked_by_revenue" do
    it "returns merchants ranked by total revenue limited by quantity" do
      merchant1 = create(:merchant)
      merchant2 = create(:merchant)
      customer = create(:customer)
      invoice1 = create(:invoice, customer: customer, merchant: merchant1)
      invoice2 = create(:invoice, customer: customer, merchant: merchant1)
      invoice3 = create(:invoice, customer: customer, merchant: merchant2)

      invoice1.transactions << create(:transaction)
      invoice2.transactions << create(:transaction)
      invoice3.transactions << create(:transaction)
      invoice1.invoice_items << create(:invoice_item)
      invoice2.invoice_items << create(:invoice_item)
      invoice3.invoice_items << create(:invoice_item)

      found_merchant = Merchant.ranked_by_revenue(1).first

      expect(found_merchant).to eq(merchant1)
    end
  end

  describe ".ranked_by_items_sold" do
    it "returns merchants ranked by items sold limited by quantity" do
      merchant1 = create(:merchant)
      merchant2 = create(:merchant)
      customer = create(:customer)
      invoice1 = create(:invoice, customer: customer, merchant: merchant1)
      invoice2 = create(:invoice, customer: customer, merchant: merchant1)
      invoice3 = create(:invoice, customer: customer, merchant: merchant2)

      invoice1.transactions << create(:transaction)
      invoice2.transactions << create(:transaction)
      invoice3.transactions << create(:transaction)
      invoice1.invoice_items << create(:invoice_item)
      invoice2.invoice_items << create(:invoice_item)
      invoice3.invoice_items << create(:invoice_item)

      found_merchant = Merchant.ranked_by_items_sold(1).first

      expect(found_merchant).to eq(merchant1)
    end
  end

  describe ".revenue_by_date" do
    it "returns revenue for a given date" do
      invoice = create(:invoice, created_at: "2012-03-16 11:55:05")
      invoice.invoice_items << create(:invoice_item, unit_price: 100, quantity: 1)
      invoice.transactions << create(:transaction, result: "success")
      found_revenue = Merchant.revenue_by_date("2012-03-16 11:55:05")

      expect(found_revenue["total_revenue"]).to eq("1.0")
    end
  end

  describe "#total_revenue" do
    it "returns the total revenue for a merchant" do
      merchant = create(:merchant)
      invoice = create(:invoice, merchant: merchant)
      invoice.transactions << create(:transaction)
      invoice.invoice_items << create(:invoice_item, unit_price: 100, quantity: 1)

      found_revenue = merchant.total_revenue({})

      expect(found_revenue["revenue"]).to eq("1.0")
    end
  end
end
