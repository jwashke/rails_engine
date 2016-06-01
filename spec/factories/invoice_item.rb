FactoryGirl.define do
  factory :invoice_item do
    item
    invoice
    sequence :quantity do |n|
      n
    end

    sequence :unit_price do |n|
      n
    end
  end
end
