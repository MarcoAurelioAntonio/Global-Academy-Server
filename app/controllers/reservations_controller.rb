class ReservationsController < ApplicationController
  def index
    @user = User.includes(:reservations).find(params[:user_id])
    @reservations = @user.reservations
    render json: JSON.pretty_generate(@reservations.as_json(only: [:created_at]))
  end
end
