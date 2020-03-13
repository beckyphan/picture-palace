class ReviewsController < ApplicationController

  def index
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
  end

  def show
  end

  def update
  end

  def destroy
  end

  private
  def review_params
    params.require(:review).permit(:review_title, :rating, :description)
  end

end
