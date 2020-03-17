class Review < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  validates_presence_of :review_title, :rating
  validates :user_id, uniqueness: {scope: :movie_id, message: "has already written a review for this movie."}

  scope :order_by_movie_with_most_reviews, -> { self.group(:movie_id).order("count(*)").count }

  def self.most_reviewed_movie
    movie_id = self.order_by_movie_with_most_reviews.first.first
    @movie = Movie.find_by(id: movie_id)
  end
end
