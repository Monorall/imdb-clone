# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(name: 'Admin',
            email: 'admin@example.com',
            password: 'password',
            password_confirmation: 'password',
            admin: true)


# Sample Movie titles
movie_titles = [
  "The Great Adventure",
  "Mysterious Island",
  "City of Secrets",
  "Lost in Time",
  "Dance of Shadows",
  "The Last Voyage",
  "Road to Nowhere",
  "Whispers of the Past",
  "Beyond the Stars",
  "The Unknown World"
]

# Same description for all movies
descriptions = ['A gripping tale of love and loss', 'A thrilling adventure across time and space', 'A heartwarming story of friendship', 'A dark and brooding mystery', 'A laugh-out-loud comedy sensation']

# Same image file name for all movies
image_file_name = "placeholder.png"

# Create 10 movies with the same description and image file name
movie_titles.each do |title|
  Movie.create(
    title: title,
    text: descriptions.sample,
    image_file_name: image_file_name
  )
end


