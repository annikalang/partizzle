# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#

require 'faker'
Booking.destroy_all
Location.destroy_all
User.destroy_all

puts 'Creating seeds for user,location and booking...'

mails = ["test@test.org", "test@test.de", "test@test.com", "test@test.us", "test@test.net"]

mails.each do |mail|
  user = User.new(
    email: mail,
    password: "123456",
    phone_number: Faker::PhoneNumber.phone_number_with_country_code,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name ,
  )
  user.save!
end

addresses = ["Westermarkt 20, 1016 GV Amsterdam",
  "Place Charles de Gaulle, 75008 Paris, France",
  "Pariser Platz, 10117 Berlin, Germany",
  "Piazza di Trevi, 00187 Roma RM, Italy",
  "Overblaak 70, 3011 MH Rotterdam",
  "Carnegieplein 2, 2517 KJ Den Haag",
  "Cra. 6 ##15-88, Bogotá, Colombia"]

addresses.each do |address|
  url = "https://res.cloudinary.com/djbsezqc3/image/upload/v1566479294/photo-1549752460-eab9bf438c87_olmdpw.jpg"
  location = Location.new(

    title: Faker::House.room,
    description: Faker::Name.last_name,
    price: € Faker::Number.number(digits: 3),
    size: Faker::Number.number(digits: 3) sq m,
    address: address,
    user: User.all.sample,
  )
  location.remote_photo_url = url
  location.save!
end

5.times do
  booking = Booking.new(

    type_of_party: "all you can damage",
    user: User.all.sample,
    location: Location.all.sample,
    start_time: Time.at(0.0 + rand * (Time.now.to_f - 0.0.to_f)),
    end_time: Time.at(0.0 + rand * (Time.now.to_f - 0.0.to_f)),
    status: ["confirmed", "rejected", "pending"].sample,
  )
  booking.save!
end



# user = User.create(email:"juansolano1034@gmail.com",password:"123456",phone_number: "4157699904",first_name:"Juan",last_name:"Solano")
# user1 = User.create(email:"annika1034@gmail.com",password:"1234567",phone_number: "4157699908",first_name:"Annika",last_name:"Lang")
# Location.create(user: user1,address: "10 theodorus Magistrat",title: "dungeon for rent",size: 100,description: "Amazing place for crazy parties",price: 300,tags: ["open","big","space"])
# Location.create(user: user,address: "40 theodorus Magistrat",title: "casttle for rent",size: 100,description: "Amazing place",price: 400,tags: ["tall","historic","space"])

puts 'Finished!'


