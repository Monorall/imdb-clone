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


placeholder_image = 'placeholder.png'
descriptions = ['A gripping tale of love and loss', 'A thrilling adventure across time and space', 'A heartwarming story of friendship', 'A dark and brooding mystery', 'A laugh-out-loud comedy sensation']

10.times do
  movie = Movie.create(title: Faker::Movie.title, text: descriptions.sample, image_file_name: placeholder_image)
  genre = Genre.create(name: Faker::Book.genre)
  Characterization.create(movie: movie, genre: genre)
end


