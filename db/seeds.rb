# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user_one = User.create(name:"David")
user_two = User.create(name:"Ernest")

food_one = Food.create(name:"Chicken", measurement_unit:"kg", price: 100, quantity: 1, user: user_one)
food_two = Food.create(name:"Rice", measurement_unit:"kg", price: 50, quantity: 5, user: user_one)
food_three = Food.create(name:"Beans", measurement_unit:"kg", price: 50, quantity: 10, user: user_one)
food_four = Food.create(name:"Tomatoes", measurement_unit:"kg", price: 50, quantity: 20, user: user_one)