# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'rest-client'

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

key = ENV['TMDB_API_KEY']

movieResp = RestClient.get("https://api.themoviedb.org/3/discover/tv?api_key=#{key}&with_networks=213")
movieArr = JSON.parse(movieResp)["results"]
# byebug

puts "Creating Movies 📺 "

movieArr.each do |movie|
  Movie.create!(
    title: movie["name"],
    overview: movie["overview"],
    img: movie["poster_path"]
  )
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
