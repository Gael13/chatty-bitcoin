Chatty.Admin.Views.Dashboard ||= {}

class Chatty.Admin.Views.Dashboard.Index extends Backbone.View
  template: JST["admin/templates/dashboard/index"]

  initialize: (options) ->
    @payments = options.payments
    @bitcoin_addresses = options.bitcoin_addresses

  event:
    'click #bitcoin_addresses .show_keys': 'show_keys'
    'click #payments .refresh': 'refresh_payments'

  render: () ->
    $(@el).html(@template(payments: @payments, bitcoin_addresses:
    @bitcoin_addresses))

    return this

  show_keys: (event) ->
    $(event.target).closest('li').children('.key').toggle()

  refresh_payments: (event) =>
    $.ajax
      url: '/admin/api/payments/refresh'
      success: (data) =>
        @bitcoin_addresses.fetch
          success: =>
            @payments.fetch
              success: =>
                new Chatty.Admin.Views.Dashboard.Index(
                  el: "#admin",
                  payments: @payments,
                  bitcoin_addresses: @bitcoin_addresses
                ).render()

        # Chatty.Admin.Routers.Dashboard.navigate ""
      error: (data) ->
        alert "Could not refresh payments!"

    false                    
    