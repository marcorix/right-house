require "open-uri"

puts "Cleaning DB"
Booking.destroy_all
House.destroy_all
User.destroy_all

puts "Creating Users"

user1 = User.create!(email: "marco@gmail.com", password: "123456", nickname: "marco")
user2 = User.create!(email: "giorgio@gmail.com", password: "123456", nickname: "giorgio")
user3 = User.create!(email: "tom@gmail.com", password: "123456", nickname: "tom")

puts "Creating Houses"

house1 = House.new(
  name: "The Beach Hut Gurnard",
  location: "Coastguard Cl, Normans Bay, Pevensey BN24 6PS",
  guests: 4,
  price: 246,
  house_type: "chalet",
  bedrooms: 2,
  user: user1
)
file = URI.open("https://mrandmrsyoung.files.wordpress.com/2013/10/img_1684.jpg")
house1.photo.attach(io: file, filename: "hut.png", content_type: "image/png")
house1.save!

house2 = House.new(
  name: "Ocean View - Bracklesham Bay",
  location: "Venton Rd, Carbis Bay, Saint Ives TR26 2AQ",
  guests: 6,
  price: 210,
  house_type: "maisonette",
  bedrooms: 3,
  user: user2
)
file = URI.open("https://boomtown-production-consumer-backup.s3.amazonaws.com/5669/files/2018/12/AdobeStock_71378302.jpg")
house2.photo.attach(io: file, filename: "ocean.png", content_type: "image/png")
house2.save!

house3 = House.new(
  name: "Luxury Apartment",
  location: "16 Victory Parade, East Village, London E20 1FS",
  guests: 4,
  price: 510,
  house_type: "flat",
  bedrooms: 2,
  user: user3
)
file = URI.open("https://www.home-designing.com/wp-content/uploads/2016/04/luxury-art-deco-apartment-interior.jpg")
house3.photo.attach(io: file, filename: "luxury.png", content_type: "image/png")
house3.save!

puts "Created #{House.count} houses"
puts "Finished!"
