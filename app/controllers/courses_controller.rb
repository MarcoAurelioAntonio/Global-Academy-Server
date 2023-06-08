class CoursesController < ApplicationController
  def show
    @course = Course.find(params[:id])
    render json: @course
  end

  def delete
    @course = Course.find(params[:id])
    @course.destroy
  end
end
