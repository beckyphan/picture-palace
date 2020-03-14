class ReviewsController < ApplicationController

  def index
    @movie = Movie.find_by(id: params[:movie_id])
    @reviews = Review.where(movie_id: params[:movie_id])
  end

  def create
     @review = Review.new(review_params)
     @review.movie_id = params[:movie_id]
     @review.user_id = current_user.id

     if @review.save
       flash[:notice] = "Thanks for sharing a review!"
       redirect_to movie_path(params[:movie_id])
     else
       flash.now[:alert] = "Errors on page. Please correct:"
       render 'new'
     end
  end

  def new
  end

  def edit
    @review = Review.find_by_id(params[:id])
  end

  def show
    @review = Review.find_by_id(params[:id])
  end

  def update
    @review = Review.find_by_id(params[:id])
    @review.update(review_params)

    if @review.save
      redirect_to movie_path(@review.movie)
    else
      flash.now[:alert] = "Errors on page. Please correct:"
      render 'edit'
    end
  end

  def destroy
    @review = Review.find_by_id(params[:id])
    @movie = @review.movie
    @review.destroy
    redirect_to movie_path(@movie)
  end

  private
  def review_params
    params.require(:review).permit(:review_title, :rating, :description)
  end

end
