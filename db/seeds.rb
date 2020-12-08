# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Dealer.destroy_all
Road.destroy_all

Truck.destroy_all
Car.destroy_all

FactoryBot.create_list(:dealer, 5)

FactoryBot.create_list(:road, 5)

5.times do
  Dealer.all.each do |dealer|
    dealer.trucks.create(year: rand(1900..2020), make: Faker::Vehicle.make, model: Faker::Vehicle.model)
  end
end

5.times do
  Road.all.each do |road|
    road.cars.create(name: Faker::Vehicle.make_and_model, parked?: Faker::Boolean.boolean)
  end
end
