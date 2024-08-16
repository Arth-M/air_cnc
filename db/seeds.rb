# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'cloudinary'
require 'faker'
require 'open-uri'

puts 'destroy db tables'
User.destroy_all
UserReview.destroy_all
FlatReview.destroy_all
Flat.destroy_all
Booking.destroy_all


require 'cloudinary'

puts 'creating users'
user1 = User.new(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: "utilisateur1@test.com",
  password: "password",
  phone_number: Faker::PhoneNumber.phone_number_with_country_code
)

file = URI.open("https://www.utopix.com/fr/blog/wp-content/uploads/2024/04/Y2E4OTI3NzQtNmUyOC00YmU2LWE5ZjctODcxY2RlMzg2ZDIy_26dfc43e-31dd-463f-ad04-56f39a430691_profilhomme1-scaled.jpg")
uploaded_file = Cloudinary::Uploader.upload(file.path, transformation: [{fetch_format: "webp"}])
user1.photo.attach(io: URI.open(uploaded_file['url']), filename: "profilhomme1.webp", content_type: "image/webp")
user1.save!
puts 'User 1 done'
user2 = User.new(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: "utilisateur2@test.com",
  password: "password",
  phone_number: Faker::PhoneNumber.phone_number_with_country_code
)

file = URI.open("https://us.123rf.com/450wm/deagreez/deagreez2012/deagreez201200759/160074289-photo-portrait-de-fille-montrant-la-langue-prenant-selfie-tenant-%C3%A0-deux-mains-dans-le-parc.jpg?ver=6")
uploaded_file = Cloudinary::Uploader.upload(file.path, transformation: [{fetch_format: "webp"}])
user2.photo.attach(io: URI.open(uploaded_file['url']), filename: "portrait_fille.webp", content_type: "image/webp")
user2.save!

puts 'created users'

puts 'creating flats'

flat0 = Flat.new(
  name: "Marke Fun on my apartment Benjamin",
  city: "Paris",
  zipcode: "75116",
  street: "12 rue lesueur",
  full_address: "12 rue lesueur 75116 Paris",
  description: "Modern apartment for the party and beach volley!",
  price: 150,
  user_id: user1.id
)

file1 = URI.open("https://cherry.img.pmdstatic.net/fit/https.3A.2F.2Fimg.2Esport.2Egentside.2Ecom.2Farticle.2Fvolley.2Fequipe-de-volley-nues_731ef0fec20dda38ce03acbe7d6c41a5e6fb04d6.2Ejpg/1200x675/quality/80/thumbnail.jpg")
p uploaded_file1 = Cloudinary::Uploader.upload(file1.path, transformation: [{fetch_format: "webp"}])
p flat0.photos.attach(io: URI.open(uploaded_file1['url']), filename: "volley1.webp", content_type: "image/webp")
flat0.save!
file2 = URI.open("https://www.shutterstock.com/image-photo/beautiful-young-woman-stands-her-600nw-1456719599.jpg")
p uploaded_file2 = Cloudinary::Uploader.upload(file2.path, transformation: [{fetch_format: "webp"}])
p flat0.photos.attach(io: URI.open(uploaded_file2['url']), filename: "volley2.webp", content_type: "image/webp")
flat0.save!

puts 'Flat 1 done'

file3 = URI.open("https://averagejoes.co.uk/wp-content/uploads/2012/07/teamgb_beach_volley-ball_girls.jpg")
p uploaded_file3 = Cloudinary::Uploader.upload(file3.path, transformation: [{fetch_format: "webp"}])
p flat0.photos.attach(io: URI.open(uploaded_file3['url']), filename: "volley3.webp", content_type: "image/webp")
flat0.save!

flat1 = Flat.new(
  name: "Urban Jewel",
  city: "Paris",
  zipcode: "75002",
  street: "25 Rue de la Paix",
  full_address: "25 Rue de la Paix, 75002 Paris",
  description: "Modern apartment with a view of the tracks, ideal for urban travelers.",
  price: 75,
  user_id: user1.id
)

file1 = URI.open("https://images.unsplash.com/photo-1512918728675-ed5a9ecdebfd?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
p uploaded_file1 = Cloudinary::Uploader.upload(file1.path, transformation: [{fetch_format: "webp"}])
p flat1.photos.attach(io: URI.open(uploaded_file1['url']), filename: "urban_jewel1.webp", content_type: "image/webp")
flat1.save!

file2 = URI.open("https://plus.unsplash.com/premium_photo-1684175656320-5c3f701c082c?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
p uploaded_file2 = Cloudinary::Uploader.upload(file2.path, transformation: [{fetch_format: "webp"}])
flat1.photos.attach(io: URI.open(uploaded_file2['url']), filename: "urban_jewel2.webp", content_type: "image/webp")
flat1.save!

file3 = URI.open("https://images.unsplash.com/photo-1499955085172-a104c9463ece?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
p uploaded_file3 = Cloudinary::Uploader.upload(file3.path, transformation: [{fetch_format: "webp"}])
p flat1.photos.attach(io: URI.open(uploaded_file3['url']), filename: "urban_jewel3.webp", content_type: "image/webp")
flat1.save!

puts 'Flat 2 done'

flat2 = Flat.new(
  name: "Central Loft",
  city: "Paris",
  zipcode: "75008",
  street: "18 Avenue des Champs-Élysées",
  full_address: "18 Avenue des Champs-Élysées, 75008 Paris",
  description: "Cozy studio near the tracks, perfect for a full city immersion.",
  price: 82,
  user_id: user1.id
)

file1 = URI.open("https://plus.unsplash.com/premium_photo-1672252617539-878656f17efe?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
p uploaded_file1 = Cloudinary::Uploader.upload(file1.path, transformation: [{fetch_format: "webp"}])
p flat2.photos.attach(io: URI.open(uploaded_file1['url']), filename: "central_loft1.webp", content_type: "image/webp")
flat2.save!

file2 = URI.open("https://images.unsplash.com/photo-1502672023488-70e25813eb80?q=80&w=3000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
p uploaded_file2 = Cloudinary::Uploader.upload(file2.path, transformation: [{fetch_format: "webp"}])
p flat2.photos.attach(io: URI.open(uploaded_file2['url']), filename: "central_loft2.webp", content_type: "image/webp")
flat2.save!

file3 = URI.open("https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?q=80&w=3000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
p uploaded_file3 = Cloudinary::Uploader.upload(file3.path, transformation: [{fetch_format: "webp"}])
p flat2.photos.attach(io: URI.open(uploaded_file3['url']), filename: "central_loft3.webp", content_type: "image/webp")
flat2.save!

puts 'Flat 3 done'

flat3 = Flat.new(
  name: "Cozy Nest",
  city: "Bordeaux",
  zipcode: "33000",
  street: "14 Rue Sainte-Catherine",
  full_address: "14 Rue Sainte-Catherine, 33000 Bordeaux",
  description: "Design loft with an industrial vibe, facing the railway.",
  price: 90,
  user_id: user2.id
)

file1 = URI.open("https://images.unsplash.com/photo-1501876725168-00c445821c9e?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
p uploaded_file1 = Cloudinary::Uploader.upload(file1.path, transformation: [{fetch_format: "webp"}])
p flat3.photos.attach(io: URI.open(uploaded_file1['url']), filename: "cozy_nest1.webp", content_type: "image/webp")
flat3.save!

file2 = URI.open("https://plus.unsplash.com/premium_photo-1680281937008-f9b19ed9afb6?q=80&w=3413&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
p uploaded_file2 = Cloudinary::Uploader.upload(file2.path, transformation: [{fetch_format: "webp"}])
p flat3.photos.attach(io: URI.open(uploaded_file2['url']), filename: "cozy_nest2.webp", content_type: "image/webp")
flat3.save!

puts 'Flat 4 done'

flat4 = Flat.new(
  name: "Panoramic Apartment",
  city: "Dijon",
  zipcode: "21000",
  street: "12 Rue de la Liberté",
  full_address: "12 Rue de la Liberté, 21000 Dijon",
  description: "Charming apartment with breathtaking views of the tracks and the city.",
  price: 85,
  user_id: user2.id
)

file1 = URI.open("https://images.unsplash.com/photo-1556020685-ae41abfc9365?q=80&w=3387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
p uploaded_file1 = Cloudinary::Uploader.upload(file1.path, transformation: [{fetch_format: "webp"}])
p flat4.photos.attach(io: URI.open(uploaded_file1['url']), filename: "panoramic_apartment1.webp", content_type: "image/webp")
flat4.save!

file2 = URI.open("https://images.unsplash.com/photo-1571598301081-36702bef5e81?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
p uploaded_file2 = Cloudinary::Uploader.upload(file2.path, transformation: [{fetch_format: "webp"}])
p flat4.photos.attach(io: URI.open(uploaded_file2['url']), filename: "panoramic_apartment2.webp", content_type: "image/webp")
flat4.save!

file3 = URI.open("https://images.unsplash.com/photo-1499916078039-922301b0eb9b?q=80&w=2585&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
p uploaded_file3 = Cloudinary::Uploader.upload(file3.path, transformation: [{fetch_format: "webp"}])
p flat4.photos.attach(io: URI.open(uploaded_file3['url']), filename: "panoramic_apartment3.webp", content_type: "image/webp")
flat4.save!

puts 'Flat 5 done'

flat5 = Flat.new(
  name: "Urban Retreat",
  city: "Lyon",
  zipcode: "69002",
  street: "8 Place Bellecour",
  full_address: "8 Place Bellecour, 69002 Lyon",
  description: "Unique space for urban architecture enthusiasts, just steps from the tracks.",
  price: 110,
  user_id: user2.id
)

file1 = URI.open("https://plus.unsplash.com/premium_photo-1683769251695-963095b23d67?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
p uploaded_file1 = Cloudinary::Uploader.upload(file1.path, transformation: [{fetch_format: "webp"}])
p flat5.photos.attach(io: URI.open(uploaded_file1['url']), filename: "urban_retreat1.webp", content_type: "image/webp")
flat5.save!

file2 = URI.open("https://images.unsplash.com/photo-1496180727794-817822f65950?q=80&w=2200&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
p uploaded_file2 = Cloudinary::Uploader.upload(file2.path, transformation: [{fetch_format: "webp"}])
p flat5.photos.attach(io: URI.open(uploaded_file2['url']), filename: "urban_retreat2.webp", content_type: "image/webp")
flat5.save!

file3 = URI.open("https://images.unsplash.com/photo-1512918728675-ed5a9ecdebfd?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
p uploaded_file3 = Cloudinary::Uploader.upload(file3.path, transformation: [{fetch_format: "webp"}])
p flat5.photos.attach(io: URI.open(uploaded_file3['url']), filename: "urban_retreat3.webp", content_type: "image/webp")
flat5.save!

puts 'Flat 6 done'

flat6 = Flat.new(
  name: "Bright Studio",
  city: "Brest",
  zipcode: "29200",
  street: "10 Rue de Siam",
  full_address: "10 Rue de Siam, 29200 Brest",
  description: "Bright apartment with large bay windows overlooking the tracks for an authentic experience.",
  price: 95,
  user_id: user2.id
)

file1 = URI.open("https://images.unsplash.com/photo-1528914137830-c85ee162f588?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
p uploaded_file1 = Cloudinary::Uploader.upload(file1.path, transformation: [{fetch_format: "webp"}])
p flat6.photos.attach(io: URI.open(uploaded_file1['url']), filename: "bright_studio1.webp", content_type: "image/webp")
flat6.save!

file2 = URI.open("https://images.unsplash.com/photo-1527772482340-7895c3f2b3f7?q=80&w=3351&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
p uploaded_file2 = Cloudinary::Uploader.upload(file2.path, transformation: [{fetch_format: "webp"}])
p flat6.photos.attach(io: URI.open(uploaded_file2['url']), filename: "bright_studio2.webp", content_type: "image/webp")
flat6.save!

file3 = URI.open("https://images.unsplash.com/photo-1460408037948-b89a5e837b41?q=80&w=3456&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
p uploaded_file3 = Cloudinary::Uploader.upload(file3.path, transformation: [{fetch_format: "webp"}])
p flat6.photos.attach(io: URI.open(uploaded_file3['url']), filename: "bright_studio3.webp", content_type: "image/webp")
flat6.save!

puts 'Flat 7 done'

flat7 = Flat.new(
  name: "Sunny Apartment",
  city: "Strasbourg",
  zipcode: "67000",
  street: "6 Rue des Bouchers",
  full_address: "6 Rue des Bouchers, 67000 Strasbourg",
  description: "Chic studio with industrial decor, direct view of the trains.",
  price: 100,
  user_id: user2.id
)

file1 = URI.open("https://plus.unsplash.com/premium_photo-1683769252575-e986af039184?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
p uploaded_file1 = Cloudinary::Uploader.upload(file1.path, transformation: [{fetch_format: "webp"}])
p flat7.photos.attach(io: URI.open(uploaded_file1['url']), filename: "sunny_apartment1.webp", content_type: "image/webp")
flat7.save!

file3 = URI.open("https://images.unsplash.com/photo-1531835551805-16d864c8d311?q=80&w=3387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
p uploaded_file3 = Cloudinary::Uploader.upload(file3.path, transformation: [{fetch_format: "webp"}])
p flat7.photos.attach(io: URI.open(uploaded_file3['url']), filename: "sunny_apartment3.webp", content_type: "image/webp")
flat7.save!

puts 'Flat 8 done'

flat8 = Flat.new(
  name: "Elegant Suite",
  city: "Toulouse",
  zipcode: "31000",
  street: "15 Rue Saint-Rome",
  full_address: "15 Rue Saint-Rome, 31000 Toulouse",
  description: "Cozy apartment in the heart of the city, just meters from the tracks.",
  price: 105,
  user_id: user2.id
)

file1 = URI.open("https://images.unsplash.com/photo-1484961361402-1ee9b1c7accb?q=80&w=2322&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
p uploaded_file1 = Cloudinary::Uploader.upload(file1.path, transformation: [{fetch_format: "webp"}])
p flat8.photos.attach(io: URI.open(uploaded_file1['url']), filename: "elegant_suite1.webp", content_type: "image/webp")
flat8.save!

file2 = URI.open("https://plus.unsplash.com/premium_photo-1676657954662-5362098c46c8?q=80&w=3387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
p uploaded_file2 = Cloudinary::Uploader.upload(file2.path, transformation: [{fetch_format: "webp"}])
p flat8.photos.attach(io: URI.open(uploaded_file2['url']), filename: "elegant_suite2.webp", content_type: "image/webp")
flat8.save!

puts 'Flat 9 done'

flat9 = Flat.new(
  name: "Modern Hideaway",
  city: "Montpellier",
  zipcode: "34000",
  street: "22 Rue de la Loge",
  full_address: "22 Rue de la Loge, 34000 Montpellier",
  description: "Trendy loft with panoramic windows overlooking the railway.",
  price: 88,
  user_id: user2.id
)

file = URI.open("https://images.unsplash.com/photo-1529408632839-a54952c491e5?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
p uploaded_file = Cloudinary::Uploader.upload(file.path, transformation: [{fetch_format: "webp"}])
p flat9.photos.attach(io: URI.open(uploaded_file['url']), filename: "modern_hideaway1.webp", content_type: "image/webp")
flat9.save!

file3 = URI.open("https://images.unsplash.com/photo-1494458453337-e9062e968178?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
p uploaded_file3 = Cloudinary::Uploader.upload(file3.path, transformation: [{fetch_format: "webp"}])
p flat9.photos.attach(io: URI.open(uploaded_file3['url']), filename: "modern_hideaway3.webp", content_type: "image/webp")
flat9.save!

puts 'flats created'

puts 'creating bookings'
flats = Flat.all

random = rand(1..10)
random_flat = flats[random]
booking1 = Booking.create(
  flat_id: random_flat.id,
  user_id: random_flat.user_id,
  start_date: '10/02/2024',
  end_date: '14/02/2024'
)

random = rand(1..10)
random_flat = flats[random]
booking2 = Booking.create!(
  flat_id: random_flat.id,
  user_id: random_flat.user_id,
   start_date: '04/06/2024',
  end_date: '29/06/2024'
)

random = rand(1..10)
random_flat = flats[random]
booking3 = Booking.create!(
  flat_id: random_flat.id,
  user_id: random_flat.user_id,
   start_date: '20/05/2024',
  end_date: '30/05/2024'
)
puts 'created bookings'

puts 'creating flat_reviews'
FlatReview.create!(
  comment: Faker::Quote.famous_last_words,
  rating: rand(1..5),
  booking_id: booking1.id,
  flat_id: Flat.first
)
puts 'created flat_reviews'

puts 'creating flat_reviews'
FlatReview.create!(
  comment: Faker::Quote.famous_last_words,
  rating: rand(1..5),
  booking_id: booking2.id,
  flat_id: Flat.first
)
puts 'created flat_reviews'

puts 'creating flat_reviews'
FlatReview.create!(
  comment: Faker::Quote.famous_last_words,
  rating: rand(1..5),
  booking_id: booking3.id,
  flat_id: Flat.first
)
puts 'created flat_reviews'


puts 'creating user_reviews'
UserReview.create!(
  comment: "The apartment is very well located with an amazing view. However, the street noise can be bothersome at night.",
  rating: rand(1..5),
  user_id: user1.id
)

UserReview.create!(
  comment: "The apartment is spacious and well-lit, but cleanliness was lacking when we arrived.",
  rating: rand(1..5),
  user_id: user2.id
)

UserReview.create!(
  comment: "Pleasant stay. The host was responsive and helpful. The apartment matched the photos well.",
  rating: rand(1..5),
  user_id: user2.id
)

puts "\n"
puts 'user_reviews created'
puts '*' * 60
puts "\n" * 2
puts 'seeding DONE !! Happy demo ❤️'