class Api::V1::UsersController < ApplicationController
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
  rescue ActiveRecord::RecordNotUnique
    render json: { error: 'Username already taken.' }, status: :not_acceptable
  end

  # POST /users/login
  def show
    @user = User.where(name: params[:id])
    if @user.first
      render json: @user.first, status: :created
    else
      render json: { error: 'User not found.' }, status: :not_found
    end
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'User not found.' }, status: :not_found
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:name)
  end
end
