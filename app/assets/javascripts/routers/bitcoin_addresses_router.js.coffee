class Chatty.Routers.BitcoinAddressesRouter extends Backbone.Router
  initialize: (options) ->
    @bitcoin_addresses = new Chatty.Collections.BitcoinAddressesCollection()
    @bitcoin_addresses.reset []
    @user_full_name = options.user_full_name

  routes:
    "index" : "index"
    "/bitcoin_addresses/new"   : "newBitcoinAddress"
    "/bitcoin_addresses/:id_alias" : "show"
    ".*" : "index"

  index: ->
    new Chatty.Views.BitcoinAddresses.IndexView(el: "#bitcoin_addresses").render(@user_full_name)

  newBitcoinAddress: ->
    @view = new Chatty.Views.BitcoinAddresses.NewView(collection:
    @bitcoin_addresses, user_full_name: @user_full_name)
    $("#bitcoin_addresses").html(@view.render(@user_full_name).el)

  show: (id_alias) ->
    bitcoin_address = new Chatty.Models.BitcoinAddress({ id: id_alias })
    bitcoin_address.fetch
      success: ->
        @view = new Chatty.Views.BitcoinAddresses.ShowView(model:
        bitcoin_address)
        $("#bitcoin_addresses").html(@view.render().el)
      error: ->
        BitcoinAddressesRouter.prototype.navigate("", true)        