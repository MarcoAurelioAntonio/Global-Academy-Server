class CourseSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :description, :start_date, :end_date, :price, :course_type, :image_url
end
