class Api::V1::ReservationsController < ApplicationController
  def index
    @user = User.includes(reservations: :course).find(params[:user_id])
    @reservations = @user.reservations
    render json: JSON.pretty_generate(@reservations.as_json(include: :course))
    # render json: @reservations.to_json(include: :course)
  end

  # POST /reservations
  def create
    @reservation = Reservation.new(reservation_params)
    @user = User.find(params[:user_id])
    @reservation.user = @user
    if @reservation.save
      render json: @reservation, status: :created
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotUnique
    render json: { error: 'You are already enrolled in this course' }, status: :not_acceptable
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Couldn't find User" }, status: :not_found
  end

  # Only allow a list of trusted parameters through.
  def reservation_params
    params.require(:reservation).permit(:course_id)
  end
end
