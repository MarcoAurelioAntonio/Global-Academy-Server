class Api::V1::ReservationsController < ApplicationController
  def index
    @user = User.includes(reservations: :course).find(params[:user_id])
    @reservations = @user.reservations
    render json: @reservations.to_json(include: :course)
  end

  # POST /reservations
  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      render json: @reservation, status: :created
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotUnique
    render json: { error: 'You are already enrolled in this course' }, status: :not_found
  end

  # Only allow a list of trusted parameters through.
  def reservation_params
    params.require(:reservation).permit(:user_id, :course_id)
  end
end
