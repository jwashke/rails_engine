require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
  end

      # let(:customer) { create(:customer, :first_name: "Josh") }

  describe ".find_one_by" do
    it "can find a record by first name" do
      customer = create(:customer)
      found_customer = Customer.find_one_by(first_name: customer.first_name)

      expect(found_customer).to eq(customer)
    end

    it "can find by first name case insensitive" do
      customer = create(:customer)
      found_customer = Customer.find_one_by(first_name: customer.first_name.upcase)

      expect(found_customer).to eq(customer)
    end

    it "can find a record by last name" do
      customer = create(:customer)
      found_customer = Customer.find_one_by(last_name: customer.last_name)

      expect(found_customer).to eq(customer)
    end

    it "can find by last name case insensitive" do
      customer = create(:customer)
      found_customer = Customer.find_one_by(last_name: customer.last_name.upcase)

      expect(found_customer).to eq(customer)
    end

    it "can find by created at" do
      customer = create(:customer)
      found_customer = Customer.find_one_by(created_at: customer.created_at)

      expect(found_customer).to eq(customer)
    end

    it "can find by updated at" do
      customer = create(:customer)
      found_customer = Customer.find_one_by(updated_at: customer.updated_at)

      expect(found_customer).to eq(customer)
    end
  end

  describe ".find_all_by" do
    it "can find all by first name" do
      customer_one = create(:customer, first_name: "name")
      customer_two = create(:customer, first_name: "name")
      found_customers = Customer.find_all_by(first_name: customer_one.first_name)

      expect(found_customers).to include(customer_one)
      expect(found_customers).to include(customer_two)
    end

    it "can find all by first_name case insensitive" do
      customer_one = create(:customer, first_name: "name")
      customer_two = create(:customer, first_name: "name")
      found_customers = Customer.find_all_by(first_name: customer_one.first_name.upcase)

      expect(found_customers).to include(customer_one)
      expect(found_customers).to include(customer_two)
    end

    it "can find all by created at" do
      time = Time.now
      customer_one = create(:customer, created_at: time)
      customer_two = create(:customer, created_at: time)
      found_customers = Customer.find_all_by(created_at: time)

      expect(found_customers).to include(customer_one)
      expect(found_customers).to include(customer_two)
    end

    it "can find all by updated at" do
      time = Time.now
      customer_one = create(:customer, updated_at: time)
      customer_two = create(:customer, updated_at: time)
      found_customers = Customer.find_all_by(updated_at: time)

      expect(found_customers).to include(customer_one)
      expect(found_customers).to include(customer_two)
    end
  end

  describe ".random" do
    it "returns a single record" do
      create_list(:customer, 2)
      found_customer = Customer.random

      expect(found_customer.count).to eq(1)
      expect(found_customer.first.class).to eq(Customer)
    end
  end

  describe ".string_params?" do
    it "returns true if params first name is present" do
      result = Customer.string_params?(first_name: "name")

      expect(result).to be_truthy
    end

    it "returns true if params last name is present" do
      result = Customer.string_params?(last_name: "name")

      expect(result).to be_truthy
    end

    it "returns false if neither are present" do
      result = Customer.string_params?(created_at: Time.now)

      expect(result).not_to be_truthy
    end
  end

  describe "#favorite_merchant" do
    it "returns the merchant where the customer has the most items bought" do
      customer1 = create(:customer)
      merchant1 = create(:merchant)
      merchant2 = create(:merchant)
      invoice1 = create(:invoice, customer: customer1, merchant: merchant1)
      invoice2 = create(:invoice, customer: customer1, merchant: merchant2)
      invoice1.transactions = [create(:transaction)]
      invoice2.transactions = [create(:transaction), create(:transaction)]

      merchant = customer1.favorite_merchant

      expect(merchant).to eq(merchant2)
    end
  end
end
