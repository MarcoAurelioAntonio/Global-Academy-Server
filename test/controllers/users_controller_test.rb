require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get api_v1_users_url
    assert_response :success
  end

  test 'should create user' do
    assert_difference('User.count') do
      post api_v1_users_url, params: { user: { name: 'test' } }
    end

    assert_response :created
  end
end
