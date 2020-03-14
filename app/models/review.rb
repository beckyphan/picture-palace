class Review < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  scope :movie_review_counts, -> { self.self.group(:movie_id).count}
  scope :order_by_movie_with_most_reviews, -> { self.group(:movie_id).order("count(*)").count }

  def self.most_reviewed_movie
    movie_id = self.order_by_movie_with_most_reviews.first.first
    @movie = Movie.find_by(id: movie_id)
  end
end
