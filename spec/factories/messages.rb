# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message do
    name "TestUser"
    content "this is my test message"
    connection_id 9875
  end
end
