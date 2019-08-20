# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
puts 'Creating restaurants...'
user = User.create(email:"juansolano1034@gmail.com",password:"123456",phone_number: "4157699904",first_name:"Juan",last_name:"Solano")
user1 = User.create(email:"annika1034@gmail.com",password:"1234567",phone_number: "4157699908",first_name:"Annika",last_name:"Lang")
Location.create(user: user1,address: "10 theodorus Magistrat",title: "dungeon for rent",size: 100,description: "Amazing place for crazy parties",price: 300,tags: ["open","big","space"])
Location.create(user: user,address: "40 theodorus Magistrat",title: "casttle for rent",size: 100,description: "Amazing place",price: 400,tags: ["tall","historic","space"])
puts 'Finished!'


