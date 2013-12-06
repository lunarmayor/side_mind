class Howard.Views.Lists extends Backbone.View
  className: 'listWrapper'


  initialize: ->
    _.bindAll @, "render"
    @collection.bind "remove", @render


  render: ->
    self = @
    @$el.html('')
    self.$el.append JST['backbone/templates/lists']()
    @collection.each (list) ->
      listView = new Howard.Views.List(model: list)
      self.$el.find('#general-lists').append listView.render()
    


    @