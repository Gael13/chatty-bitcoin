class Chatty.Models.BitcoinAddress extends Backbone.Model
  paramRoot: 'bitcoin_address'
  urlRoot: '/api/bitcoin_addresses'

  defaults:
    description: null

class Chatty.Collections.BitcoinAddressesCollection extends Backbone.Collection
  model: Chatty.Models.BitcoinAddress
  url: '/api/bitcoin_addresses'    