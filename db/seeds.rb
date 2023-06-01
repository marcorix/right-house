
puts "Cleaning DB"

House.destroy_all
User.destroy_all

puts "Creating Users"

user1 = User.create!(email: "marco@gmail.com", password: "123456")
user2 = User.create!(email: "giorgio@gmail.com", password: "123456")
user3 = User.create!(email: "tom@gmail.com", password: "123456")

puts "Creating Houses"

House.create!(
  name: "The Beach Hut Gurnard-stunning beachside location",
  location: "Coastguard Cl, Normans Bay, Pevensey BN24 6PS",
  guests: 4,
  price: 246,
  house_type: "chalet",
  bedrooms: 2,
  user: user1
)

House.create!(
  name: "Ocean View - Bracklesham Bay",
  location: "Venton Rd, Carbis Bay, Saint Ives TR26 2AQ",
  guests: 6,
  price: 210,
  house_type: "maisonette",
  bedrooms: 3,
  user: user2
)

House.create!(
  name: "Luxury Apartment",
  location: "16 Victory Parade, East Village, London E20 1FS",
  guests: 4,
  price: 510,
  house_type: "flat",
  bedrooms: 2,
  user: user3
)
