class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user

  def index
  
  end

  def create
  	current_user.follow(@user)
    respond_to do |format|
      format.js {}
    end
  end

  def update
  	current_user.unfollow(@user)
    respond_to do |format|
      format.js {}
    end  
  end
 
 private
  def find_user
  	@user = User.find(params[:id])
  end

end
