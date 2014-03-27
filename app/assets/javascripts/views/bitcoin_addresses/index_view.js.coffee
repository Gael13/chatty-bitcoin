Chatty.Views.BitcoinAddresses ||= {}

class Chatty.Views.BitcoinAddresses.IndexView extends Backbone.View
  template: JST["templates/bitcoin_addresses/index"]

  render: (user_name) ->
    $(@el).html(@template(user_name: user_name))

    return this