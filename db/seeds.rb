# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

movies_list = [
  ["Joker", "Drama/Thriller", 2019, "https://66.media.tumblr.com/e252861d46495e70048ee3184c065e21/tumblr_ppe6jgBCOU1rrkahjo1_540.gifv"],
  ["Toy Story 4", "Fantasy/Adventure", 2019, "https://www.movieposters4u.com/images/t/ToyStory4C.jpg"],
  ["Booksmart", "Comedy/Coming-of-Age Fiction", 2019, "https://cdn.cinematerial.com/p/500x/8lbtoa99/booksmart-british-movie-poster.jpg?v=1560539704"],
  ["Learning to Skateboard in a Warzone", "Documentary", 2019, "https://drraa3ej68s2c.cloudfront.net/wp-content/uploads/2020/01/13102058/4c39868dcba0bd48a699d4b6e71a5634361efdf816c4588387e7071df9ceed7d-1024x1024.jpg"],
  ["Marriage Story", "Drama", 2019, "https://drraa3ej68s2c.cloudfront.net/wp-content/uploads/2020/01/06114253/5b2ab1eb3f1765adcf5c04b761f1540c15d2d6a51c27b55d71d996e51bd51fa8-1024x1024.jpg"],
  ["Ford v Ferrari", "Drama/Sport", 2019, "https://drraa3ej68s2c.cloudfront.net/wp-content/uploads/2020/01/06114112/48883b4cc41dccf1a54caa5ace0431640f71cc958b53a6abcada7c95c425ef5d-1024x1024.jpg"],
  ["The Irishman", "Drama/Crime", 2019, "https://drraa3ej68s2c.cloudfront.net/wp-content/uploads/2020/01/06153535/22a18b0989e71c30e27742d1a63f243d6f3201a4d707a1d0191649adf019f241-1024x1024.jpg"],
  ["Parasite", "Drama/Mystery", 2019, "https://drraa3ej68s2c.cloudfront.net/wp-content/uploads/2020/01/06114353/81328e5c94a3aac53f9f5d97044626c442bca314d5046844117d107938e95aa3-1024x1024.jpg"],
  ["How to Train Your Dragon: The Hidden World", "Fantasy/Action", 2019, "https://drraa3ej68s2c.cloudfront.net/wp-content/uploads/2020/01/06114137/0f54b1e3e78a1921e4b5a1f37f6685ca5abd9a9aac3d05e0a3825a2db0b5ef7f-1024x1024.jpg"],
  ["Missing Link", "Fantasy/Adventure", 2019, "https://drraa3ej68s2c.cloudfront.net/wp-content/uploads/2020/01/06114317/f24280b8d1d046ec879f86a2c403aee551f42569e642fcc996c4e71efe3cf353-1024x1024.jpg"]
]

movies_list.each do |m, g, y, url|
  Movie.create(movie_title: m, genre: g, year: y, image_url: url)
end
