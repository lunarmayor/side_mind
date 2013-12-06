class Howard.Views.List extends Backbone.View
  className: 'list'

  render: ->
  	self = @
  	@$el.attr 'id', 'list-'+ @model.get('id')
  	@$el.html JST['backbone/templates/list'](list: @model.toJSON())