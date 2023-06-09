# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

# Create 100 users
100.times do
  User.create(name: Faker::Name.unique.name)
end

# Create 5 random courses
course_id = 1
5.times do
  Course.create(
    id: course_id,
    name: Faker::ProgrammingLanguage.name,
    description: Faker::Lorem.sentence,
    course_type: Faker::Lorem.word,
    price: Faker::Number.decimal(l_digits: 4, r_digits: 2),
    start_date: Faker::Date.between(from: '2021-06-01', to: '2021-06-30'),
    end_date: Faker::Date.between(from: '2021-06-01', to: '2021-06-30')
  )
  course_id += 1
end

# Create 5 reservations for each user
User.all.each do |user|
  5.times do
    course = Course.all.sample
    Reservation.create(user_id: user.id, course_id: course.id)
  end
end
