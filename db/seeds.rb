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
require 'open-uri'

puts 'destroy db tables'
UserReview.destroy_all
FlatReview.destroy_all
Booking.destroy_all
User.destroy_all
Flat.destroy_all

puts 'creating users'
user1 = User.new(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: "utilisateur1@test.com",
  password: "password",
  phone_number: Faker::PhoneNumber.phone_number_with_country_code
)

file = URI.open("https://www.utopix.com/fr/blog/wp-content/uploads/2024/04/Y2E4OTI3NzQtNmUyOC00YmU2LWE5ZjctODcxY2RlMzg2ZDIy_26dfc43e-31dd-463f-ad04-56f39a430691_profilhomme1-scaled.jpg")
user1.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
user1.save!

user2 = User.new(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: "utilisateur2@test.com",
  password: "password",
  phone_number: Faker::PhoneNumber.phone_number_with_country_code
)

file = URI.open("https://us.123rf.com/450wm/deagreez/deagreez2012/deagreez201200759/160074289-photo-portrait-de-fille-montrant-la-langue-prenant-selfie-tenant-%C3%A0-deux-mains-dans-le-parc.jpg?ver=6")
user2.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
user2.save!

user3 = User.new(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: "utilisateur3@test.com",
  password: "password",
  phone_number: Faker::PhoneNumber.phone_number_with_country_code
)

file = URI.open("https://wallpaper.forfun.com/fetch/08/086a1cf6ac0246813a5b94cb60954a01.jpeg")
user3.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
user3.save!

puts 'created users'


puts 'creating renters'
renter1 = User.new(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: "bailleur1@test.com",
  password: "password",
  phone_number: Faker::PhoneNumber.phone_number_with_country_code,
)

file = URI.open("https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg")
renter1.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
renter1.save!

renter2 = User.new(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: "bailleur2@test.com",
  password: "password",
  phone_number: Faker::PhoneNumber.phone_number_with_country_code
)

file = URI.open("https://www.utopix.com/fr/blog/wp-content/uploads/2024/04/ZGUzNmViOGQtMjE4MS00MzdjLTk1OWMtNjUzMmFlOWUxN2Zh_414c3606-acc3-415b-8227-86ea6d932268_profilhomme8-scaled.jpg")
renter2.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
renter2.save!

renter3 = User.new(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: "bailleur3@test.com",
  password: "password",
  phone_number: Faker::PhoneNumber.phone_number_with_country_code
)

file = URI.open("https://mediaslide-europe.storage.googleapis.com/profil/pictures/11345/24398/profile-1686219488-ff52b4cf016b7019e38c26392fe0bbdb.jpg")
renter3.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
renter3.save!

puts 'renters created'


puts 'creating flats'
users = User.all

flat0 = Flat.new(
  name: "Marke Fun on my appartment Benjamin",
  city: "Paris",
  zipcode: "75116",
  street: "12 rue lesueur",
  full_address: "12 rue lesueur 75116 paris",
  description: "Modern apartment for the party and beach volley !",
  price: 150,
  user_id: user1.id
)

file1 = URI.open("https://cherry.img.pmdstatic.net/fit/https.3A.2F.2Fimg.2Esport.2Egentside.2Ecom.2Farticle.2Fvolley.2Fequipe-de-volley-nues_731ef0fec20dda38ce03acbe7d6c41a5e6fb04d6.2Ejpg/1200x675/quality/80/thumbnail.jpg")
flat0.photos.attach(io: file1, filename: "nes.png", content_type: "image/png")
flat0.save!

file2 = URI.open("https://www.shutterstock.com/image-photo/beautiful-young-woman-stands-her-600nw-1456719599.jpg")
flat0.photos.attach(io: file2, filename: "nes.png", content_type: "image/png")
flat0.save!

file3 = URI.open("https://averagejoes.co.uk/wp-content/uploads/2012/07/teamgb_beach_volley-ball_girls.jpg")
flat0.photos.attach(io: file3, filename: "nes.png", content_type: "image/png")
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
flat1.photos.attach(io: file1, filename: "nes.png", content_type: "image/png")
flat1.save!

file2 = URI.open("https://plus.unsplash.com/premium_photo-1684175656320-5c3f701c082c?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
flat1.photos.attach(io: file2, filename: "nes.png", content_type: "image/png")
flat1.save!

file3 = URI.open("https://images.unsplash.com/photo-1499955085172-a104c9463ece?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
flat1.photos.attach(io: file3, filename: "nes.png", content_type: "image/png")
flat1.save!

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
flat2.photos.attach(io: file1, filename: "nes.png", content_type: "image/png")
flat2.save!

file2 = URI.open("https://images.unsplash.com/photo-1502672023488-70e25813eb80?q=80&w=3000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
flat2.photos.attach(io: file2, filename: "nes.png", content_type: "image/png")
flat2.save!

file3 = URI.open("https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?q=80&w=3000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
flat2.photos.attach(io: file3, filename: "nes.png", content_type: "image/png")
flat2.save!

flat3 = Flat.new(
  name: "Cozy Nest",
  city: "Bordeaux",
  zipcode: "33000",
  street: "14 Rue Sainte-Catherine",
  full_address: "14 Rue Sainte-Catherine, 33000 Bordeaux",
  description: "Design loft with an industrial vibe, facing the railway.",
  price: 90,
  user_id: user1.id
)

file1 = URI.open("https://images.unsplash.com/photo-1501876725168-00c445821c9e?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
flat3.photos.attach(io: file1, filename: "nes.png", content_type: "image/png")
flat3.save!

file2 = URI.open("https://plus.unsplash.com/premium_photo-1680281937008-f9b19ed9afb6?q=80&w=3413&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
flat3.photos.attach(io: file2, filename: "nes.png", content_type: "image/png")
flat3.save!

file3 = URI.open("https://images.unsplash.com/photo-1493809842364-78817add7ffb?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
flat3.photos.attach(io: file3, filename: "nes.png", content_type: "image/png")
flat3.save!

flat4 = Flat.new(
  name: "Panoramic Apartment",
  city: "Dijon",
  zipcode: "21000",
  street: "12 Rue de la Liberté",
  full_address: "12 Rue de la Liberté, 21000 Dijon",
  description: "Charming apartment with breathtaking views of the tracks and the city.",
  price: 85,
  user_id: user1.id
)

file1 = URI.open("https://images.unsplash.com/photo-1556020685-ae41abfc9365?q=80&w=3387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
flat4.photos.attach(io: file1, filename: "nes.png", content_type: "image/png")
flat4.save!

file2 = URI.open("https://images.unsplash.com/photo-1571598301081-36702bef5e81?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
flat4.photos.attach(io: file2, filename: "nes.png", content_type: "image/png")
flat4.save!

file3 = URI.open("https://images.unsplash.com/photo-1499916078039-922301b0eb9b?q=80&w=2585&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
flat4.photos.attach(io: file3, filename: "nes.png", content_type: "image/png")
flat4.save!

flat5 = Flat.new(
  name: "Urban Retreat",
  city: "Lyon",
  zipcode: "69002",
  street: "8 Place Bellecour",
  full_address: "8 Place Bellecour, 69002 Lyon",
  description: "Unique space for urban architecture enthusiasts, just steps from the tracks.",
  price: 110,
  user_id: user1.id
)

file1 = URI.open("https://plus.unsplash.com/premium_photo-1683769251695-963095b23d67?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
flat5.photos.attach(io: file1, filename: "nes.png", content_type: "image/png")
flat5.save!

file2 = URI.open("https://images.unsplash.com/photo-1496180727794-817822f65950?q=80&w=2200&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
flat5.photos.attach(io: file2, filename: "nes.png", content_type: "image/png")
flat5.save!

file3 = URI.open("https://images.unsplash.com/photo-1512918728675-ed5a9ecdebfd?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
flat5.photos.attach(io: file3, filename: "nes.png", content_type: "image/png")
flat5.save!

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
flat6.photos.attach(io: file1, filename: "nes.png", content_type: "image/png")
flat6.save!

file2 = URI.open("https://images.unsplash.com/photo-1527772482340-7895c3f2b3f7?q=80&w=3351&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
flat6.photos.attach(io: file2, filename: "nes.png", content_type: "image/png")
flat6.save!

file3 = URI.open("https://images.unsplash.com/photo-1460408037948-b89a5e837b41?q=80&w=3456&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
flat6.photos.attach(io: file3, filename: "nes.png", content_type: "image/png")
flat6.save!

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
flat7.photos.attach(io: file1, filename: "nes.png", content_type: "image/png")
flat7.save!

file2 = URI.open("https://images.unsplash.com/photo-1489936724440-afaf5a115ede?q=80&w=3502&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
flat7.photos.attach(io: file2, filename: "nes.png", content_type: "image/png")
flat7.save!

file3 = URI.open("https://images.unsplash.com/photo-1531835551805-16d864c8d311?q=80&w=3387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
flat7.photos.attach(io: file3, filename: "nes.png", content_type: "image/png")
flat7.save!

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
flat8.photos.attach(io: file1, filename: "nes.png", content_type: "image/png")
flat8.save!

file2 = URI.open("https://plus.unsplash.com/premium_photo-1676657954662-5362098c46c8?q=80&w=3387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
flat8.photos.attach(io: file2, filename: "nes.png", content_type: "image/png")
flat8.save!

file3 = URI.open("https://images.unsplash.com/photo-1500307353842-81f527a10685?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
flat8.photos.attach(io: file3, filename: "nes.png", content_type: "image/png")
flat8.save!

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
flat9.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
flat9.save!

file2 = URI.open("https://images.unsplash.com/photo-1486304873000-235643847519?q=80&w=3432&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
flat9.photos.attach(io: file2, filename: "nes.png", content_type: "image/png")
flat9.save!

file3 = URI.open("https://images.unsplash.com/photo-1494458453337-e9062e968178?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
flat9.photos.attach(io: file3, filename: "nes.png", content_type: "image/png")
flat9.save!

flat10 = Flat.new(
  name: "Hidden Terrace",
  city: "Paris",
  zipcode: "75009",
  street: "19 Rue des Martyrs",
  full_address: "19 Rue des Martyrs, 75009 Paris",
  description: "Modern apartment offering a unique view of the urban tracks.",
  price: 115,
  user_id: user2.id
)

file1 = URI.open("https://images.unsplash.com/photo-1494281232141-90a40b0b06c9?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
flat10.photos.attach(io: file1, filename: "nes.png", content_type: "image/png")
flat10.save!

file2 = URI.open("https://images.unsplash.com/photo-1515263487990-61b07816b324?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
flat10.photos.attach(io: file2, filename: "nes.png", content_type: "image/png")
flat10.save!

file3 = URI.open("https://plus.unsplash.com/premium_photo-1672252617602-e5de5c6aba9c?q=80&w=3465&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
flat10.photos.attach(io: file3, filename: "nes.png", content_type: "image/png")
flat10.save!

flat11 = Flat.new(
  name: "Dream Loft",
  city: "La Rochelle",
  zipcode: "17000",
  street: "3 Rue de la Marine",
  full_address: "3 Rue de la Marine, 17000 La Rochelle",
  description: "Studio with an industrial touch, ideal for train noise lovers.",
  price: 120,
  user_id: user3.id
)

file1 = URI.open("https://images.unsplash.com/photo-1531383339897-f369f6422e40?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
flat11.photos.attach(io: file1, filename: "nes.png", content_type: "image/png")
flat11.save!

file2 = URI.open("https://images.unsplash.com/photo-1529408686214-b48b8532f72c?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
flat11.photos.attach(io: file2, filename: "nes.png", content_type: "image/png")
flat11.save!

file3 = URI.open("https://images.unsplash.com/photo-1497262693247-aa258f96c4f5?q=80&w=3376&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
flat11.photos.attach(io: file3, filename: "nes.png", content_type: "image/png")
flat11.save!

flat12 = Flat.new(
  name: "Bohemian Studio",
  city: "Nice",
  zipcode: "06000",
  street: "11 Rue Masséna",
  full_address: "11 Rue Masséna, 06000 Nice",
  description: "Stylish apartment with a view of the tracks, perfect for urban nomads.",
  price: 98,
  user_id: user3.id
)

file = URI.open("https://images.unsplash.com/photo-1484154218962-a197022b5858?q=80&w=3548&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
flat12.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
flat12.save!

file2 = URI.open("https://plus.unsplash.com/premium_photo-1683769250375-1bdf0ec9d80f?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
flat12.photos.attach(io: file2, filename: "nes.png", content_type: "image/png")
flat12.save!

file3 = URI.open("https://images.unsplash.com/photo-1520386950581-900a51cbbc93?q=80&w=1935&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
flat12.photos.attach(io: file3, filename: "nes.png", content_type: "image/png")
flat12.save!

flat13 = Flat.new(
  name: "Chic Getaway",
  city: "Rouen",
  zipcode: "76000",
  street: "9 Rue du Gros-Horloge",
  full_address: "9 Rue du Gros-Horloge, 76000 Rouen",
  description: "Comfortable space with contemporary decor, close to the tracks.",
  price: 102,
  user_id: user3.id
)

file = URI.open("https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
flat13.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
flat13.save!

file2 = URI.open("https://images.unsplash.com/photo-1466098672325-c9ddda4b7975?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
flat13.photos.attach(io: file2, filename: "nes.png", content_type: "image/png")
flat13.save!

file3 = URI.open("https://plus.unsplash.com/premium_photo-1684175656154-ac52b3cc2c60?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
flat13.photos.attach(io: file3, filename: "nes.png", content_type: "image/png")
flat13.save!

flat14 = Flat.new(
  name: "Little Paradise",
  city: "Toulouse",
  zipcode: "3100",
  street: "20 Rue d’Alsace-Lorraine",
  full_address: "20 Rue d’Alsace-Lorraine, 31000 Toulouse",
  description: "Well-located apartment with a picturesque glimpse of the city’s tracks.",
  price: 89,
  user_id: user3.id
)

file1 = URI.open("https://images.unsplash.com/photo-1465799764858-e630882adf82?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
flat14.photos.attach(io: file1, filename: "nes.png", content_type: "image/png")
flat14.save!

file2 = URI.open("https://plus.unsplash.com/premium_photo-1676321046262-4978a752fb15?q=80&w=3542&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
flat14.photos.attach(io: file2, filename: "nes.png", content_type: "image/png")
flat14.save!

file3 = URI.open("https://images.unsplash.com/photo-1534655610770-dd69616f05ff?q=80&w=3356&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
flat14.photos.attach(io: file3, filename: "nes.png", content_type: "image/png")
flat14.save!

flat15 = Flat.new(
  name: "Royal Suite",
  city: "Ajaccio",
  zipcode: "20000",
  street: "7 Rue Fesch",
  full_address: "7 Rue Fesch, 20000 Ajaccio",
  description: "Compact studio with a distinctive view otracks for an authentic stay.",
  price: 112,
  user_id: user3.id
)

file1 = URI.open("https://images.unsplash.com/photo-1528914137830-c85ee162f588?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
flat15.photos.attach(io: file1, filename: "fjfjfj.png", content_type: "image/png")
flat15.save!

file2 = URI.open("https://plus.unsplash.com/premium_photo-1676321046262-4978a752fb15?q=80&w=3542&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
flat15.photos.attach(io: file2, filename: "pokfz.png", content_type: "image/png")
flat15.save!

file3 = URI.open("https://images.unsplash.com/photo-1465799764858-e630882adf82?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
flat15.photos.attach(io: file3, filename: "pofvjk.png", content_type: "image/png")
flat15.save!

puts 'flats created'

puts 'creating bookings'
flats = Flat.all

random = rand(1..15)
random_flat = flats[random]
booking1 = Booking.create(
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
  booking_id: booking1.id,
  flat_id: 1
)
puts 'created flat_reviews'

puts 'creating flat_reviews'
FlatReview.create!(
  comment: Faker::Quote.famous_last_words,
  rating: rand(1..5),
  booking_id: booking2.id,
  flat_id: 1
)
puts 'created flat_reviews'

puts 'creating flat_reviews'
FlatReview.create!(
  comment: Faker::Quote.famous_last_words,
  rating: rand(1..5),
  booking_id: booking3.id,
  flat_id: 1
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
