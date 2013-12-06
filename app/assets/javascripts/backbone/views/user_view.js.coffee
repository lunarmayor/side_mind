class Howard.Views.User extends Backbone.View
  className: 'howard'

  events:
  	'click .today': 'visitToday'
  	'click .week': 'visitWeek'
  	'click .shared': 'visitShared'

  render: ->
    @$el.html JST["backbone/templates/index"](user: @model.toJSON())
    @


  visitToday: ->
  	console.log "hey"

  visitWeek: ->
  	Howard.data.mainRouter.navigate('lists', true);

  visitShared: ->
  	console.log "why"
  
  