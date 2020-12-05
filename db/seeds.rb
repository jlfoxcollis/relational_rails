# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Dealer.destroy_all
Road.destroy_all

medved = Dealer.create!(name: "Medved", city: "Denver", state: "CO", open: true)
bradley_ford = Dealer.create!(name: "Bradley Ford", city: "LHC", state: "CO", open: true, created_at: "2020-12-03 16:10:00")
medved.trucks.create!(year: 1999, model: "F150", make: "Ford")
bradley_ford.trucks.create!(year: 1984, model: "Ford", make: "Van")
