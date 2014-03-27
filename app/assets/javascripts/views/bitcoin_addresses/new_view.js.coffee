Chatty.Views.BitcoinAddresses ||= {}

class Chatty.Views.BitcoinAddresses.NewView extends Backbone.View
  template: JST["templates/bitcoin_addresses/new"]

  events:
    "submit #new-bitcoin-address": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()
    @model.bind("change:errors", () =>
      this.render(options.user_name)
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (post) =>
        @model = post
        window.location.hash = "/bitcoin_addresses/#{@model.attributes.id_alias}"
      error: (post, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: (user_name) ->
    hash = @model.toJSON()
    hash.user_name = user_name
    $(@el).html(@template(hash))

    if @model.get('errors')?
      @displayErrors @model.get('errors')

    this.$("form").backboneLink(@model)
    
    return this

  displayErrors: (errors) ->
    addError = (field) ->
    $("#bitcoin_address_#{field}_input").addClass('error')
    $("#bitcoin_address_#{field}_input .controls").append("<span class=\"help-
    inline\">#{errors[field]}</span>")

    addError field for field in _.keys(errors)        