class UsersController < ApplicationController

  def index
    @users = User.all.order(:name).limit(10)
    render json: JSON.pretty_generate(@users.as_json)
    # vrender json: @users, only: [:name]
  end
  
  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:name)
  end
end
