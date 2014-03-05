# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bitcoin_address do
    id_alias "MyString"
    address "MyString"
    private_key "MyString"
    public_key "MyString"
    description "MyText"
  end
end
