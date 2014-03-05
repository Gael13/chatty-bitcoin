# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :address_external do
    address "MyString"
    forwardable false
  end
end
