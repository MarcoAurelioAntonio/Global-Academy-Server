class UsersController < ApplicationController
	def index
		@users = User.all.order(:name).limit(10)
		render json: JSON.pretty_generate(@users.as_json)
		#vrender json: @users, only: [:name]
	end
end
