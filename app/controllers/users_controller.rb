class UsersController < ApplicationController

	def index
		
	end

	def about
		@user = User.find_by(id: params[:id])
	end

	def show
		
	end
end
