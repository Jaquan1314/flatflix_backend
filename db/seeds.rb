# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Favorite.destroy_all
Movie.destroy_all
User.destroy_all


puts "Creating Users 👨‍👩‍👧‍👦 "
user_arr = [
  {
    username: "Javaughn", 
    password: "abc123", 
    email: "something@something" 
  },
  {
    username: "Shevaughn", 
    password: "abc123", 
    email: "something@something" 
  },
  {
    username: "Tashawn", 
    password: "abc123", 
    email: "something@something" 
  },
]

user_arr.each do |userObj|
  User.create!(userObj)
end

puts "Creating Movies 📺 "
movie_arr = [
  {
    title: "Step Up: High Water",
    overview: "Dancing Movie",
    img: "https://lionsgate.brightspotcdn.com/b0/0b/68611fe24fe6ad77684632205408/step-up-high-water-season-1-shows-background-01.jpg"
  },
  {
    title: "The Croods",
    overview: "Cavemen",
    img: "https://static01.nyt.com/images/2020/11/23/arts/croods1/merlin_180254292_b13cc31e-dd95-4326-8dfa-45c88ecd0dcf-superJumbo.jpg"
  },
  {
    title: "Bridgerton",
    overview: "Fancy Royals",
    img: "https://static.hollywoodreporter.com/wp-content/uploads/2020/12/BRIDGERTON_105_Unit_01118RC-h-2020-1608340119-928x523.jpg"
  },
]

movie_arr.each do |movieObj|
  Movie.create!(movieObj)
end

puts "Creating Favorites ⭐️ "
favorite_arr = [
  {
    user_id: User.first.id,
    movie_id: Movie.first.id
  },
  {
    user_id: User.second.id,
    movie_id: Movie.second.id
  },
  {
    user_id: User.third.id,
    movie_id: Movie.third.id
  },
  {
    user_id: User.first.id,
    movie_id: Movie.third.id
  },
]

favorite_arr.each do |favoriteObj|
  Favorite.create!(favoriteObj)
end
