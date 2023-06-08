class CoursesController < ApplicationController
  before_action :set_course, only: %i[show destroy]

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
