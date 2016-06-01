require 'rails_helper'

RSpec.describe Invoice, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:customer_id) }
    it { is_expected.to validate_presence_of(:merchant_id) }
    it { is_expected.to validate_presence_of(:status) }
  end

  describe "associations" do
    it { is_expected.to belong_to(:customer) }
    it { is_expected.to belong_to(:merchant) }
  end

  describe ".find_one_by" do
    it "can find a record by customer id" do
      invoice = create(:invoice)
      found_invoice = Invoice.find_one_by(customer_id: invoice.customer_id).first

      expect(found_invoice).to eq(invoice)
    end

    it "can find a record by merchant id" do
      invoice = create(:invoice)
      found_invoice = Invoice.find_one_by(merchant_id: invoice.merchant_id).first

      expect(found_invoice).to eq(invoice)
    end

    it "can find a record by status" do
      invoice = create(:invoice)
      found_invoice = Invoice.find_one_by(status: invoice.status).first

      expect(found_invoice).to eq(invoice)
    end

    it "can find a record by created at" do
      invoice = create(:invoice)
      found_invoice = Invoice.find_one_by(created_at: invoice.created_at).first

      expect(found_invoice).to eq(invoice)
    end

    it "can find a record by updated at" do
      invoice = create(:invoice)
      found_invoice = Invoice.find_one_by(updated_at: invoice.updated_at).first

      expect(found_invoice).to eq(invoice)
    end
  end

  describe ".find_all_by" do
    it "can find all records by customer id" do
      invoice_one = create(:invoice)
      invoice_two = create(:invoice, customer_id: invoice_one.customer_id)
      found_invoices = Invoice.find_all_by(customer_id: invoice_one.customer_id)

      expect(found_invoices).to include(invoice_one)
      expect(found_invoices).to include(invoice_two)
    end

    it "can find a record by merchant id" do
      invoice_one = create(:invoice)
      invoice_two = create(:invoice, merchant_id: invoice_one.merchant_id)
      found_invoices = Invoice.find_all_by(merchant_id: invoice_one.merchant_id)

      expect(found_invoices).to include(invoice_one)
      expect(found_invoices).to include(invoice_two)
    end

    it "can find a record by status" do
      invoice_one = create(:invoice)
      invoice_two = create(:invoice, status: invoice_one.status)
      found_invoices = Invoice.find_all_by(status: invoice_one.status)

      expect(found_invoices).to include(invoice_one)
      expect(found_invoices).to include(invoice_two)
    end

    it "can find a record by created at" do
      invoice_one = create(:invoice)
      invoice_two = create(:invoice, created_at: invoice_one.created_at)
      found_invoices = Invoice.find_all_by(created_at: invoice_one.created_at)

      expect(found_invoices).to include(invoice_one)
      expect(found_invoices).to include(invoice_two)
    end

    it "can find a record by updated at" do
      invoice_one = create(:invoice)
      invoice_two = create(:invoice, updated_at: invoice_one.updated_at)
      found_invoices = Invoice.find_all_by(updated_at: invoice_one.updated_at)

      expect(found_invoices).to include(invoice_one)
      expect(found_invoices).to include(invoice_two)
    end
  end

  describe ".random" do
    it "returns a single record" do
      create_list(:invoice, 2)
      found_invoice = Invoice.random

      expect(found_invoice.count).to eq(1)
      expect(found_invoice.first.class).to eq(Invoice)
    end
  end

  describe ".string_params?" do
    it "returns true if params status is present" do
      result = Invoice.string_params?(status: "shipped")

      expect(result).to be_truthy
    end

    it "returns false if neither are present" do
      result = Invoice.string_params?(created_at: Time.now)

      expect(result).not_to be_truthy
    end
  end
end
