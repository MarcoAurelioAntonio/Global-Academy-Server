class CoursesController < ApplicationController
  def index
    @courses = Course.all
    render json: { courses: @courses }
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
end
