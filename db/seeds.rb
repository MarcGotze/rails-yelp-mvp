# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Restaurant.destroy_all
puts "Creating restaurants..."
puts "==========================================="
10.times do
  new_restaurant = Restaurant.new(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.phone_number,
    category: Restaurant::CATEGORIES.sample
  )
  new_restaurant.save!
  5.times do
    Review.create!(
      rating: Faker::Number.between(from: 0, to: 5),
      content: Faker::Restaurant.review,
      restaurant: new_restaurant
    )
  end
  puts new_restaurant.name
end
puts "==========================================="
puts "Completed !"
