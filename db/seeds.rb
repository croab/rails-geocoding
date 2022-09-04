# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name:
require "faker"

puts "Creating seeds..."

cities = %i(Amsterdam London Paris Berlin Stockholm Helsinki Madrid Cairo Oslo Edinburgh)

cities.each do |city|
  # location = Geocoder.search(Faker::Address.full_address)
  location = Geocoder.search(city)
  lat = location.first.coordinates[0]
  lon = location.first.coordinates[1]
  flat = Flat.new(name: Faker::Name.name, address: city, latitude: lat, longitude: lon)
  flat.save!
end

puts "Finished!"
