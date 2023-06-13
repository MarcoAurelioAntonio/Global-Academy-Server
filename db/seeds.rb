# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create 5 users
5.times do
  User.create(name: Faker::Name.name)
end

# Create 20 courses
20.times do
  Course.create(
    name: Faker::Educator.course_name,
    start_date: Faker::Date.between(from: 1.year.ago, to: 1.year.from_now),
    end_date: Faker::Date.between(from: 1.year.from_now, to: 2.years.from_now),
    description: Faker::Lorem.characters(number: 30),
    course_type: Faker::Lorem.word,
    price: Faker::Number.decimal(l_digits: 2)
  )
end

# Create 20 reservations with random users and courses
User.all.each do |user|
  courses = Course.all.sample(4)
  courses.each do |course|
    next if user.reservations.exists?(course_id: course.id)
    Reservation.create(user: user, course: course)
  end
end

