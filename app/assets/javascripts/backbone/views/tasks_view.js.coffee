class Howard.Views.Tasks extends Backbone.View
  className: 'taskWrapper'

  events:
    "click .glyphicon-plus-sign": "createInput"
    "keypress .new-task-input": "submitOnEnter"


  initialize: ->
    _.bindAll @, "render"
    @collection.bind "remove", @render
    @collection.bind "change:done", =>
      @render()
    socket = io.connect('//localhost:3001/')
    socket.on('message', (data) =>
      user = new Howard.Models.User()
      user.fetch
        success: =>
          if user.get('id') == Howard.currentUserId
            @collection.reset(user.get('tasks'))
            @render())

      
    

    

  render: ->
    self = @
    @$el.html ''

    @collection.sort()
    @collection.each (task) ->
      taskView = new Howard.Views.Task( model: task )
      self.$el.append taskView.render()
    
    self.$el.append JST['backbone/templates/tasks']()

    @

  createInput: ->
  	$("#inputs").append(JST['backbone/templates/task_input']())
  	$("#inputs").find('input').first().focus()

  submitOnEnter: (e) ->
    if e.keyCode == 13
      lastInputIndex =  $('input','#inputs').length - 1
      $('input','#inputs').each (index, input) =>
        if index != lastInputIndex
          task = new Howard.Models.Task({content: $(input).val()})
          task.save({},{success: (model, response) =>
            model.id = model.attributes.task.id
            @collection.add model})
        else
          task = new Howard.Models.Task({content: $(input).val()})
          task.save({},{success: (model, response) =>
            model.id = model.attributes.task.id
            @collection.add model
            
            @render()})
         
          
          
        
         
      
          
        
