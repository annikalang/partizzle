# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup)
require 'faker'
Booking.destroy_all
Location.destroy_all
User.destroy_all

puts 'Creating seeds for user,location and booking...'

mails = ["annika@test.com", "jp@test.com", "ximena@test.com", "theresa@test.com"]
first_names = ["Annika", "JP", "Ximena", "Theresa"]
last_names = ["Lang", "Solano", "De la Camara", "Kruse"]

puts 'creating users'

mails.each_with_index do |mail, i|
  user = User.new(
    email: mail,
    password: "123456",
    phone_number: Faker::PhoneNumber.phone_number_with_country_code,
    first_name: first_names[i],
    last_name: last_names[i]
  )
  user.save!
end

addresses =
 ["Pariser Platz, 10117 Berlin, Germany",
  "Overblaak 70, 3011 MH Rotterdam",
  "Westermarkt 20, 1016 GV Amsterdam",
  "9 Rue Mandar, 75002 Paris, France",
  "Viale Vaticano, 00165 Roma RM, Italy",
  "Carnegieplein 2, 2517 KJ Den Haag",
  "Cra. 6 ##15-88, Bogotá, Colombia",
  "Zaventemweg 3, 1043 EH Amsterdam"]

descriptions = ["Very spacious and clean, in a great location and amazing decoration.",
  "The perfect place to relax, recharge, and enjoy!",
  "Perfect location, friendly owner.",
  "Unforgettable location with enchanting surroundings.",
  "Great for entertaining: spacious and awesome newly decorated room.",
  "We loved our stay. Best party ever!",
  "Lovely neighborhood. Beautifully furnished room.",
  "Luxurious room in town centre."]

titles = ["German garage with a crazy amount of room",
  "Crazy cool boathouse in Rotterdam",
  "Crazy small attic room in Amsterdam",
  "Garden in Paris for crazy parties",
  "Huge basement room in the middle of Rome",
  "The ultimate dream bicycle closet",
  "Very cosy common room in Colombia",
  "Luxurious living room in Amsterdam"]

  prices = [100, 300, 200, 150, 200, 150, 100, 300]

puts 'creating fake addresses, fake descriptions and fake titles for the locations'
addresses.each_with_index do |address, i|
  url = "https://loremflickr.com/1024/768/cocktail"
  location = Location.new(
    title: titles[i],
    description: descriptions[i],
    price: prices[i],
    size: (30..500).to_a.sample,
    address: address,
    user: User.all.sample
  )
  location.remote_photo_url = url
  location.save!
end

puts 'creating multiple types of parties for bookings'
5.times do
  booking = Booking.new(

    type_of_party:["All you can damage party", "Fun dance party", "Quiet get together", "A very chill party", "A nice surprise party", "Soirée"].sample,
    user: User.all.sample,
    location: Location.all.sample,
    start_time: Time.at(0.0 + rand * (Time.now.to_f - 0.0.to_f)),
    end_time: Time.at(0.0 + rand * (Time.now.to_f - 0.0.to_f)),
    status: ["confirmed", "rejected", "pending"].sample,
  )
  booking.save!
end

# 8.times do
#   review = Review.new(
#     content: ["Had a great time there!", "DON'T GO THERE!!", "Had the best time there!"],
#     rating: (0..5).to_a.sample,
#     booking: Booking.all.sample,
#   )
#   booking.save!
# end

# user = User.create(email:"juansolano1034@gmail.com",password:"123456",phone_number: "4157699904",first_name:"Juan",last_name:"Solano")
# user1 = User.create(email:"annika1034@gmail.com",password:"1234567",phone_number: "4157699908",first_name:"Annika",last_name:"Lang")
# Location.create(user: user1,address: "10 theodorus Magistrat",title: "dungeon for rent",size: 100,description: "Amazing place for crazy parties",price: 300,tags: ["open","big","space"])
# Location.create(user: user,address: "40 theodorus Magistrat",title: "casttle for rent",size: 100,description: "Amazing place",price: 400,tags: ["tall","historic","space"])

puts 'Finished!'


