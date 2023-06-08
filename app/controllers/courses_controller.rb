class CoursesController < ApplicationController
  def show
    @course = Course.find(params[:id])
  end

  def delete
    @course = Course.find(params[:id])
    @course.destroy
    redirect_to courses_path
  end
end
