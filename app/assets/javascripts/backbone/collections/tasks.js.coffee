class Howard.Collections.Tasks extends Backbone.Collection
  model: Howard.Models.Task
  url: '/tasks'
  
  comparator: (model) ->
  	if model.get('done') then 1 else 0
