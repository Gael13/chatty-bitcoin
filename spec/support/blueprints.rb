require 'machinist/active_record'
require 'sham'
require 'faker'

Sham.name { Faker::Name.name }
Sham.email { Faker::Internet.email }
Sham.title { Faker::Lorem.sentence }
Sham.body { Faker::Lorem.paragraph }

User.bluprint do 
  name
  email
  password { 'super secret' }
  password_confirmation { 'super secret' }
end

Site.blueprint do
  name { "#{Faker::Name.name}'s Chatty" }
end

BitcoinAddress.blueprint do
  private_key { Bitcoin::Key.generate.priv }
  public_key { Bitcoin::Key.new(private_key).pub }
  address { Bitcoin::Key.new(private_key).addr }
  description { Sham.body }
end

AddressExternal.blueprint do 
  address { Bitcoin::Key.generate.addr }
end

Payment.blueprint do
  transaction
  bitcoin_address
  amount { rand * 10 }
end

Transaction.blueprint do
  binary { BPS::Bitcoin.parse_transaction_json(BitcoinHelpers::Data.transaction_json_1).to_payload }
end             