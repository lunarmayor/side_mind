class ListsController < ApplicationController
  respond_to :json
  

  def index
  	@lists = current_user.lists
    respond_with @lists, root: false
  end

end
