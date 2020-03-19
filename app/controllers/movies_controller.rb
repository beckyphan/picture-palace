class MoviesController < ApplicationController
  before_action :authenticate_user!, except: [:landing]

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
    @movie = Movie.find_by_id(params[:id])
  end

  def search
    # binding.pry
    @movie = Movie.find_by(movie_title: params[:movie][:movie_title])

    if @movie
      redirect_to movie_path(@movie)
    else
      flash[:alert] = "Movie not found."
      redirect_to movies_path
    end
  end

  def show
    @movie = Movie.find_by_id(params[:id])
    @movie_events = @movie.events
    @event = Event.new

    @review = Review.new
    @reviews = @movie.reviews
  end

  def update
    @movie = Movie.find_by_id(params[:id])

    if @movie.update(movie_params)
      flash[:notice] = "Movie Updated!"
      redirect_to movie_path(@movie)
    else
      flash.now[:alert] = "Errors on page. Please correct:"
      render 'edit'
    end
  end

  # should not be able to delete a movie, can always edit
  # def destroy
  # end

  private

  def movie_params
    params.require(:movie).permit(:movie_title, :genre, :year, :image_url)
  end

end
