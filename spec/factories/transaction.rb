FactoryGirl.define do
  factory :transaction do
    invoice
    credit_card_number "4242-4242-4242-4242"
    result "success"
  end
end
