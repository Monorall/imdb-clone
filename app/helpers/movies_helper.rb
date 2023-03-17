module MoviesHelper
  def average_stars(movie)
    if movie.ratings.count > 0
      average = movie.ratings.average(:stars)
      "Average rating: #{'%.1f' % average} / 10"
    else
      "No ratings yet"
    end
  end
end
