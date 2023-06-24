class Api::V1::CoursesController < ApplicationController
  before_action :set_course, only: %i[show destroy]

  def index
    @courses = Course.all
    render json: CourseSerializer.new(@courses).serializable_hash[:data].map { |hash| hash[:attributes] }
  end

  def create
    @new_course = Course.new(course_params)
    @new_course.save!
    if @new_course.save
      render json: @new_course, status: :created
    else
      render json: @new_course.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: CourseSerializer.new(@course).serializable_hash[:data][:attributes]
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

  def course_params
    params.require(:course).permit(:name, :start_date, :end_date, :description,
                                   :course_type, :price, :image)
  end
end
