require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:unit_price) }
    it { is_expected.to validate_presence_of(:merchant_id) }
  end

  describe "associations" do
    it { is_expected.to belong_to(:merchant) }
  end

  describe ".find_one_by" do
    it "can find a record by name" do
      item = create(:item)
      found_Item = Item.find_one_by(name: item.name).first

      expect(found_Item).to eq(item)
    end

    it "can find a record by merchant id" do
      item = create(:item)
      found_Item = Item.find_one_by(merchant_id: item.merchant_id).first

      expect(found_Item).to eq(item)
    end

    it "can find a record by description" do
      item = create(:item)
      found_Item = Item.find_one_by(description: item.description).first

      expect(found_Item).to eq(item)
    end

    it "can find a record by created at" do
      item = create(:item)
      found_Item = Item.find_one_by(created_at: item.created_at).first

      expect(found_Item).to eq(item)
    end

    it "can find a record by updated at" do
      item = create(:item)
      found_Item = Item.find_one_by(updated_at: item.updated_at).first

      expect(found_Item).to eq(item)
    end
  end

  describe ".find_all_by" do
    it "can find all records by name" do
      item_one = create(:item)
      item_two = create(:item, name: item_one.name)
      found_Items = Item.find_all_by(name: item_one.name)

      expect(found_Items).to include(item_one)
      expect(found_Items).to include(item_two)
    end

    it "can find a record by merchant id" do
      item_one = create(:item)
      item_two = create(:item, merchant_id: item_one.merchant_id)
      found_Items = Item.find_all_by(merchant_id: item_one.merchant_id)

      expect(found_Items).to include(item_one)
      expect(found_Items).to include(item_two)
    end

    it "can find a record by description" do
      item_one = create(:item)
      item_two = create(:item, description: item_one.description)
      found_Items = Item.find_all_by(description: item_one.description)

      expect(found_Items).to include(item_one)
      expect(found_Items).to include(item_two)
    end

    it "can find a record by created at" do
      item_one = create(:item)
      item_two = create(:item, created_at: item_one.created_at)
      found_Items = Item.find_all_by(created_at: item_one.created_at)

      expect(found_Items).to include(item_one)
      expect(found_Items).to include(item_two)
    end

    it "can find a record by updated at" do
      item_one = create(:item)
      item_two = create(:item, updated_at: item_one.updated_at)
      found_items = Item.find_all_by(updated_at: item_one.updated_at)

      expect(found_items).to include(item_one)
      expect(found_items).to include(item_two)
    end
  end

  describe ".random" do
    it "returns a single record" do
      create_list(:item, 2)
      found_Item = Item.random

      expect(found_Item.count).to eq(1)
      expect(found_Item.first.class).to eq(Item)
    end
  end

  describe ".string_params?" do
    it "returns true if params name is present" do
      result = Item.string_params?(name: "name")

      expect(result).to be_truthy
    end

    it "returns true if params description is present" do
      result = Item.string_params?(description: "description")

      expect(result).to be_truthy
    end

    it "returns false if neither are present" do
      result = Item.string_params?(created_at: Time.now)

      expect(result).not_to be_truthy
    end
  end
end
