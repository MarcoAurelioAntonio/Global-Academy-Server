class ReservationsController < ApplicationController
  def index
    @user = User.includes(:reservations).find(params[:user_id])
    @reservations = @user.reservations
    render json: JSON.pretty_generate(@reservations.as_json(only: [:created_at]))
  end

  # POST /reservations
  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      render json: @reservation, status: :created
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  # Only allow a list of trusted parameters through.
  def reservation_params
    params.require(:reservation).permit(:user_id,:course_id)
  end
end
