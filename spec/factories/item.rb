FactoryGirl.define do
  factory :item do
    sequence :name do |n|
      "name #{n}"
    end
    sequence :description do |n|
      "description #{n}"
    end
    sequence :unit_price do |n|
      n
    end
    merchant
  end
end
