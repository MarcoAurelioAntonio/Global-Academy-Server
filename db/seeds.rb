# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

100.times do
  User.create(name: Faker::Name.unique.name)
end

User.all.each do |user|
  5.times do
    user.reservations.create
  end
end

Course.create(name: "Ruby", description: "Ruby is a dynamic, open source programming language with a focus on simplicity and productivity. It has an elegant syntax that is natural to read and easy to write.", price: 1000, start_date: "2021-06-01", end_date: "2021-06-30")
