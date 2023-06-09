class Api::V1::CoursesController < ApplicationController
  before_action :set_course, only: %i[show destroy]

  def index
    @courses = Course.all
    render json: JSON.pretty_generate(@courses.as_json)
  end

  def create
    @new_course = Course.new(params.require(:course).permit(:name, :start_date, :end_date, :description,
                                                            :course_type, :price))
    @new_course.save!
    if @new_course.save
      render json: @new_course, status: :created
    else
      render json: @new_course.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @course
  end

  def destroy
    @course.destroy
    head :no_content
  end

  private

  def set_course
    @course = Course.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Course not found' }, status: :not_found
  end
end
