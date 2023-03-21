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


Genre.create(name: "Action")
Genre.create(name: "Comedy")
Genre.create(name: "Drama")
Genre.create(name: "Horror")
Genre.create(name: "Romance")


