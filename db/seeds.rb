# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

puts 'destroy db tables'
UserReview.destroy_all
FlatReview.destroy_all
Booking.destroy_all
User.destroy_all
Flat.destroy_all

puts 'creating users'
  user1 = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: "utilisateur1@test.com",
    password: "password",
    phone_number: Faker::PhoneNumber.phone_number_with_country_code
  )
  user2 = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: "utilisateur2@test.com",
    password: "password",
    phone_number: Faker::PhoneNumber.phone_number_with_country_code
  )
  user3 = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: "utilisateur3@test.com",
    password: "password",
    phone_number: Faker::PhoneNumber.phone_number_with_country_code
  )
puts 'created users'


puts 'creating renters'
  renter1 = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: "bailleur1@test.com",
    password: "password",
    phone_number: Faker::PhoneNumber.phone_number_with_country_code
  )
  renter2 = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: "bailleur2@test.com",
    password: "password",
    phone_number: Faker::PhoneNumber.phone_number_with_country_code
  )
  renter3 = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: "bailleur3@test.com",
    password: "password",
    phone_number: Faker::PhoneNumber.phone_number_with_country_code
  )
puts 'renters created'


puts 'creating flats'
users = User.all
name = Faker::House.room
city = Faker::Address.city
zipcode = Faker::Address.zip_code
street = Faker::Address.street_address
5.times do
  Flat.create!(
    name: "Flat with a beautiful #{name}",
    city: city,
    zipcode: zipcode,
    street: street,
    full_address: "#{street}, #{zipcode} - #{city}",
    description: "Enjoy our beautiful flat with #{name}",
    price: Faker::Commerce.price,
    user_id: user1.id
  )
end
5.times do
  Flat.create!(
    name: "Flat with a beautiful #{name}",
    city: city,
    zipcode: zipcode,
    street: street,
    full_address: "#{street}, #{zipcode} - #{city}",
    description: "Enjoy our beautiful flat with #{name}",
    price: Faker::Commerce.price,
    user_id: user2.id
  )
end
5.times do
  Flat.create!(
    name: "Flat with a beautiful #{name}",
    city: city,
    zipcode: zipcode,
    street: street,
    full_address: "#{street}, #{zipcode} - #{city}",
    description: "Enjoy our beautiful flat with #{name}",
    price: Faker::Commerce.price,
    user_id: user3.id
  )
end
puts 'flats created'

puts 'creating bookings'
flats = Flat.all

random = rand(1..15)
random_flat = flats[random]
booking1 = Booking.create!(
  flat_id: random_flat.id,
  user_id: random_flat.user_id
)

random = rand(1..15)
random_flat = flats[random]
booking2 = Booking.create!(
  flat_id: random_flat.id,
  user_id: random_flat.user_id
)

random = rand(1..15)
random_flat = flats[random]
booking3 = Booking.create!(
  flat_id: random_flat.id,
  user_id: random_flat.user_id
)
puts 'created bookings'

puts 'creating flat_reviews'
FlatReview.create!(
  comment: Faker::Quote.famous_last_words,
  rating: rand(1..5),
  booking_id: booking1.id
)
puts 'created flat_reviews'

puts 'creating flat_reviews'
FlatReview.create!(
  comment: Faker::Quote.famous_last_words,
  rating: rand(1..5),
  booking_id: booking2.id
)
puts 'created flat_reviews'

puts 'creating flat_reviews'
FlatReview.create!(
  comment: Faker::Quote.famous_last_words,
  rating: rand(1..5),
  booking_id: booking3.id
)
puts 'created flat_reviews'


puts 'creating user_reviews'
UserReview.create!(
  comment: Faker::Quote.famous_last_words,
  rating: rand(1..5),
  user_id: user1.id
)
UserReview.create!(
  comment: Faker::Quote.famous_last_words,
  rating: rand(1..5),
  user_id: user2.id
)
UserReview.create!(
  comment: Faker::Quote.famous_last_words,
  rating: rand(1..5),
  user_id: user3.id
)
puts 'user_reviews created'
