# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :payment do
    bitcoin_address_id 1
    transaction_id 1
    amount "9.99"
  end
end
