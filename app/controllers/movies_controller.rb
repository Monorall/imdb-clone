class MoviesController < ApplicationController
  def index
    @movies = ["Lord of the Rings", "Superman", "Spider-Man", "Star Wars"]
  end
end
