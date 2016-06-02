require 'rails_helper'

RSpec.describe InvoiceItem, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:item_id) }
    it { is_expected.to validate_presence_of(:invoice_id) }
    it { is_expected.to validate_presence_of(:quantity) }
    it { is_expected.to validate_presence_of(:unit_price) }
  end

  describe "associations" do
    it { is_expected.to belong_to(:item) }
    it { is_expected.to belong_to(:invoice) }
  end

  describe ".find_one_by" do
    it "can find a record by item id" do
      invoice_item = create(:invoice_item)
      found_invoice_item = InvoiceItem.find_one_by(item_id: invoice_item.item_id)

      expect(found_invoice_item).to eq(invoice_item)
    end

    it "can find a record by invoice id" do
      invoice_item = create(:invoice_item)
      found_invoice_item = InvoiceItem.find_one_by(invoice_id: invoice_item.invoice_id)

      expect(found_invoice_item).to eq(invoice_item)
    end

    it "can find a record by quantity" do
      invoice_item = create(:invoice_item)
      found_invoice_item = InvoiceItem.find_one_by(quantity: invoice_item.quantity)

      expect(found_invoice_item).to eq(invoice_item)
    end

    it "can find a record by unit price" do
      invoice_item = create(:invoice_item, unit_price: 100)
      found_invoice_item = InvoiceItem.find_one_by(unit_price: "1.00")

      expect(found_invoice_item).to eq(invoice_item)
    end

    it "can find a record by created at" do
      invoice_item = create(:invoice_item)
      found_invoice_item = InvoiceItem.find_one_by(created_at: invoice_item.created_at)

      expect(found_invoice_item).to eq(invoice_item)
    end

    it "can find a record by updated at" do
      invoice_item = create(:invoice_item)
      found_invoice_item = InvoiceItem.find_one_by(updated_at: invoice_item.updated_at)

      expect(found_invoice_item).to eq(invoice_item)
    end
  end

  describe ".find_all_by" do
    it "can find all records by item id" do
      invoice_item_one = create(:invoice_item)
      invoice_item_two = create(:invoice_item, item_id: invoice_item_one.item_id)
      found_invoice_items = InvoiceItem.find_all_by(item_id: invoice_item_one.item_id)

      expect(found_invoice_items).to include(invoice_item_one)
      expect(found_invoice_items).to include(invoice_item_two)
    end

    it "can find a record by invoice id" do
      invoice_item_one = create(:invoice_item)
      invoice_item_two = create(:invoice_item, invoice_id: invoice_item_one.invoice_id)
      found_invoice_items = InvoiceItem.find_all_by(invoice_id: invoice_item_one.invoice_id)

      expect(found_invoice_items).to include(invoice_item_one)
      expect(found_invoice_items).to include(invoice_item_two)
    end

    it "can find a record by quantity" do
      invoice_item_one = create(:invoice_item)
      invoice_item_two = create(:invoice_item, quantity: invoice_item_one.quantity)
      found_invoice_items = InvoiceItem.find_all_by(quantity: invoice_item_one.quantity)

      expect(found_invoice_items).to include(invoice_item_one)
      expect(found_invoice_items).to include(invoice_item_two)
    end

    it "can find a record by unit price" do
      invoice_item_one = create(:invoice_item, unit_price: 100)
      invoice_item_two = create(:invoice_item, unit_price: 100)
      found_invoice_items = InvoiceItem.find_all_by(unit_price: "1.00")

      expect(found_invoice_items).to include(invoice_item_one)
      expect(found_invoice_items).to include(invoice_item_two)
    end

    it "can find a record by created at" do
      invoice_item_one = create(:invoice_item)
      invoice_item_two = create(:invoice_item, created_at: invoice_item_one.created_at)
      found_invoice_items = InvoiceItem.find_all_by(created_at: invoice_item_one.created_at)

      expect(found_invoice_items).to include(invoice_item_one)
      expect(found_invoice_items).to include(invoice_item_two)
    end

    it "can find a record by updated at" do
      invoice_item_one = create(:invoice_item)
      invoice_item_two = create(:invoice_item, updated_at: invoice_item_one.updated_at)
      found_invoice_items = InvoiceItem.find_all_by(updated_at: invoice_item_one.updated_at)

      expect(found_invoice_items).to include(invoice_item_one)
      expect(found_invoice_items).to include(invoice_item_two)
    end
  end

  describe ".random" do
    it "returns a single record" do
      create_list(:invoice_item, 2)
      found_invoice_item = InvoiceItem.random

      expect(found_invoice_item.count).to eq(1)
      expect(found_invoice_item.first.class).to eq(InvoiceItem)
    end
  end

  describe ".sanitize_unit_price" do
    it "changes a string decimal unit price to integer" do
      params = { unit_price: "100.00" }
      sanitized_price = InvoiceItem.sanitize_unit_price(params)

      expect(sanitized_price).to eq(10000)
    end
  end
end
