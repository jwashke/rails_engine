FactoryGirl.define do
  factory :merchant do
    sequence :name do |n|
      "name #{n}"
    end
  end
end
