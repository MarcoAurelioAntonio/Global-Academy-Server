require 'test_helper'

class CoursesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get courses_url
    assert_response :success
  end

  test 'should get show' do
    get course_url(courses(:one))
    assert_response :success
  end

  test 'should create course' do
    assert_difference('Course.count') do
      post courses_url,
           params: { course: { name: 'test', description: courses(:one).description, price: 1, course_type: 'test',
                               start_date: '2018-01-01', end_date: '2018-01-01' } }
    end

    assert_response :created
  end

  test 'should destroy course' do
    assert_difference('Course.count', -1) do
      delete course_url(courses(:one))
    end

    assert_response :no_content
  end
end
