class MoviesController < ApplicationController

  def landing
  end

  def index
    @movie = Movie.new

    @movies = Movie.all
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      flash.now[:notice] = "Movie Added!"
      redirect_to movies_path
    else
      flash.now[:alert] = "Errors on page. Please correct:"
      render 'new'
    end
  end

  def new
    @movie = Movie.new
  end

  def edit
  end

  def show
    @movie = Movie.find_by_id(params[:id])
  end

  def update
  end

  def destroy
  end

  private

  def movie_params
    params.require(:movie).permit(:movie_title, :genre, :year, :image_url)
  end

end
