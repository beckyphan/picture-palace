class Movie < ApplicationRecord
  validates_presence_of :movie_title, :genre, :year, :image_url
  validates :movie_title, uniqueness: {scope: :year, message: "matches an existing movie, in same year."}

  has_many :reviews
  has_many :events


  has_many :viewers, through: :reviews, source: :viewer, foreign_key: 'user_id'
  # has_many :users, through: :reviews
  # has_many :viewers, through :reviews ... so make sure Review table uses same name to reference user & indicates the table (User) and foreign_key (user_id)
  # source: :viewer indicates who the association belongs_to (User)
  # foreign_key indicates which column to look in for the Viewer (User) table
  # ex. SELECT "users".* FROM "users" INNER JOIN "reviews" ON "users"."id" = "reviews"."user_id" WHERE "reviews"."movie_id" = $1 LIMIT $2  [["movie_id", 12], ["LIMIT", 11]]

  def avg_rating
    self.reviews.average("rating").round
  end
end
