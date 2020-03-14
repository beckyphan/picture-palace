class Review < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  validates_presence_of :review_title, :rating
  validates :user_id, uniqueness: {scope: :movie_id, message: "has already written a review for this movie."}

  scope :movie_review_counts, -> { self.self.group(:movie_id).count}
  scope :order_by_movie_with_most_reviews, -> { self.group(:movie_id).order("count(*)").count }
  scope :for_movie, -> movie_object { where(movie_id: movie_object.id)}

  def self.most_reviewed_movie
    movie_id = self.order_by_movie_with_most_reviews.first.first
    @movie = Movie.find_by(id: movie_id)
  end
end
