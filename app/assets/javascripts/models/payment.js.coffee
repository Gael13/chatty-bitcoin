class Chatty.Models.Payment extends Backbone.Model
  paramRoot: 'payment'
  urlRoot: '/payments'

class Chatty.Collections.PaymentsCollection extends Backbone.Collection
  model: Chatty.Models.Payment
  url: '/payments'