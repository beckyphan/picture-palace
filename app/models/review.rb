class Review < ApplicationRecord
  belongs_to :movie
  belongs_to :viewer, class_name: "User", foreign_key: "user_id"
  # belongs_to :user, class_name: "User", foreign_key: "user_id"
  # means Review.user looks up a a user by user_id in the User table
  # aka Review.viewer looks up a viewer by user_id in the User table

  validates_presence_of :review_title, :rating
  validates :user_id, uniqueness: {scope: :movie_id, message: "has already written a review for this movie."}

  scope :order_by_movie_with_most_reviews, -> { self.group(:movie_id).order("count(*)").count }

  def self.most_reviewed_movie
    movie_id = self.order_by_movie_with_most_reviews.first.first
    @movie = Movie.find_by(id: movie_id)
  end
end
