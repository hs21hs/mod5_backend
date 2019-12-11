# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: "haider")
# User.create(name: "steve")
Giver.create(user_id: 1)
Rider.create(user_id: 1)
FoodBank.create(name: "food4all")


Delivery.create(rider_id: 1, giver_id:1, food_bank_id:1)

# Delivery.create(rider_id: 1, giver_id: 2)
