class MoviesController < ApplicationController
  before_action :require_sign_in, except: [:index, :show]
  before_action :require_admin, except: [:index, :show]

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      flash[:notice] = "Movie successfully create!"
      redirect_to @movie
    else
      render :new, status: :unprocessable_entity
    end
  end
  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      flash[:notice] = "Movie successfully update!"

      redirect_to @movie
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_url, status: :see_other,
                alert: "Movie successfully deleted!"
  end


  private

  def movie_params
    params.require(:movie).
      permit(:title, :text, :rating, :category, :image_file_name)
  end
end
