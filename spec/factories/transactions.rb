# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :transaction do
    binary ""
    bitcoin_tx_hash "MyString"
  end
end
