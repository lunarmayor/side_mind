#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.Howard =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}
  data: {}
  initialize: (data) ->
    this.data.mainRouter = new Howard.Routers.User()
    Backbone.history.start()