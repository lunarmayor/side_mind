class Howard.Routers.User extends Backbone.Router

  routes:
    "": "show"
    "lists": "lists"

  show: ->
    that = this
    @user = new Howard.Models.User()
    @user.fetch
      success: =>
        Howard.currentUserId  = @user.get('id')
        userView = new Howard.Views.User model: @user
        $('#howard').html userView.render().$el
        window.renderHoward()
        tasks = new Howard.Collections.Tasks @user.get('tasks')
        tasksView = new Howard.Views.Tasks collection: tasks
        $('.tasks').prepend tasksView.render().$el
  

  lists: ->
    if $('nav-links').length == 0
      that = this
      @user = new Howard.Models.User()
      @user.fetch
        success: =>
          Howard.currentUserId = @user.get('id')
          userView = new Howard.Views.User model: @user
          $('#howard').html userView.render().$el
          window.renderHoward()
          lists = new Howard.Collections.Lists()
          lists.fetch
            success: =>
              console.log(lists)
              listsView = new Howard.Views.Lists collection: lists
              $('#lists').append listsView.render().$el






    


    