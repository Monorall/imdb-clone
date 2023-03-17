class RatingsController < ApplicationController
  before_action :require_sign_in

  def create
    @movie = Movie.find(params[:movie_id])
    @rating = @movie.ratings.find_or_initialize_by(user: current_user)
    @rating.update(rating_params)

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @movie }
    end
  end

  def update
    @rating = Rating.find(params[:id])
    if @rating.update(rating_params)
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_back(fallback_location: root_path) }
      end
    else
      render :edit
    end
  end


  private

  def rating_params
    params.require(:rating).permit(:stars)
  end
end
