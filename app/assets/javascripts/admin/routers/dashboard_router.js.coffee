class Chatty.Admin.Routers.Dashboard extends Backbone.Routers
  initialize: ->
    @bitcoin_addresses = new Chatty.Collections.BitcoinAddressesCollection()
    @bitcoin_addresses.url = '/admin/api/bitcoin_addresses'
    @bitcoin_addresses.reset []

    @payments = new Chatty.Collections.PaymentsCollection()
    @payments.url = '/admin/api/payments'
    @payments.reset []

  routes:
    "index" : "index"
    ".*" : "index"

  index  : ->
    @bitcoin_addresses.fetch
      success: =>
        @payments.fetch
          success: =>
            new Chatty.Admin.Views.Dashboard.Index (
              el: "#admin",
              payments: @payments,
              bitcoin_addresses: @bitcoin_addresses
            ).render()