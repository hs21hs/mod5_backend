# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

 #User.create(name: "haider",postcode: "n1 6pw")
#  User.create(name: "steve")
# Giver.create(user_id: 1, postcode: "n1 6pw")
# Rider.create(user_id: 1)
FoodBank.create(name: "food4all")
 ua= User.create(name: "adam", email: "a@hotmail.com", password: "a", img: "data:image/jpeg;base64,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")
 Giver.create(user_id: ua.id)
    Rider.create(user_id: ua.id)
uw = User.create(name: "wendy", email: "w@hotmail.com", password: "w", img:"data:image/jpeg;base64,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")
Giver.create(user_id: uw.id)
            Rider.create(user_id: uw.id)
ue = User.create(name: "eric", email: "e@hotmail.com", password: "e", img:"https://i2.wp.com/screenrant.com/wp-content/uploads/Eric-Murphy-in-Entourage.jpg?resize=720%2C360&ssl=1")
Giver.create(user_id: ue.id)
            Rider.create(user_id: ue.id)
# Delivery.create(rider_id: 1, giver_id:1, food_bank_id:1)
# Delivery.create(rider_id: 1, giver_id: 2)
# Ad.create(giver_id: 1, postcode: "n1 6pw")
# Ad.create(giver_id: 1, postcode: "sw3 4ry")
# Ad.create(giver_id: 1, postcode: "n1 5eh")
# latitude: "51.5326946", longitude: "-0.0811076"

# Location.create(postcode: "nw9 5hb", state: "London", country: "United Kingdom")
# Location.create(postcode: "n1 6pw", state: "London", country: "United Kingdom")
# Geocoder.coordinates("25 Main St, Cooperstown, NY")
# Geocoder::Calculations.distance_between([51.5323296159264,-0.0823514644476475],[51.594394441671,-0.252138781223535])