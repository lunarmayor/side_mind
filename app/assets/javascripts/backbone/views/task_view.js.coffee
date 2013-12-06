class Howard.Views.Task extends Backbone.View
  className: 'task'

  events:
    'click .edit': 'showFields'
    'dblclick .task-text': 'showFields'
    'click .save': 'save'
    'mouseenter .col-sm-10': 'toggleTools'
    'mouseleave .col-sm-10': 'toggleTools'
    'click .col-xs-2': "toggleCompletion"
    'click .delete': 'delete'
    'keypress .edit-task-input': "saveOnEnter"
    'blur .edit-task-input': 'save'

  delete: ->
    @model.destroy()

  hideFields: (e) ->
   # @$el.find('.field').hide()
   # @$el.find('.text').show()

  render: ->
    self = @
    console.log('h')
    @$el.attr 'id', 'task-' + @model.get('id')
    @$el.html JST["backbone/templates/task"](task: @model.toJSON())
  

  saveOnEnter: (e) =>
    if e.keyCode == 13
      @save()
  save: =>
    unless @$el.find('input, textarea').val() == ""
      @$el.find('input, textarea').each =>
        @model.save({content: @$el.find('input, textarea').val() }, {wait: true, success: =>
          @render()})
    else
      @model.destroy()


  showFields: (e) ->
    @$el.find('.task-text').hide()
    oldVal = @$el.find('.edit-task-input').val()
    @$el.find('.edit-task-input').val("")
    @$el.find('.task-input').first().show()
    @$el.find('.edit-task-input').focus().val(oldVal)
    @$el.find('.col-xs-8').css("background-color", "#8BACA1")
    


  toggleTools: (e)->
    @$el.find('.edit').toggleClass('hidden')
    @$el.find('.delete').toggleClass('hidden')

  toggleCompletion: ->
    @model.set({done: !@model.get('done')})
    @model.save()










