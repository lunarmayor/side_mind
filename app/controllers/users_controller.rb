class UsersController < ApplicationController
  respond_to :html, :json
  before_filter :authenticate_user!
  

  def index
  	@user = current_user
  	respond_with @user, root: false
  end

  def show
  end
end
