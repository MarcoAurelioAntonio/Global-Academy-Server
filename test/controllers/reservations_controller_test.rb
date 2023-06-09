require 'test_helper'

class ReservationsControllerTest < ActionDispatch::IntegrationTest

  test 'should get index' do
    get user_reservations_path(users(:one))
    assert_response :success
  end

  test 'should create reservation' do
    assert_difference('Reservation.count') do
      post user_reservations_path(users(:one)), params: { reservation: { course_id: courses(:three).id, user_id: users(:one).id } }
    end

    assert_response :created
  end


end
