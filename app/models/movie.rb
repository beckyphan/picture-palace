class Movie < ApplicationRecord
  validates_presence_of :movie_title, :genre, :year, :image_url
  validates :movie_title, uniqueness: {scope: :year, message: "matches an existing movie, in same year."}

  has_many :reviews
  has_many :events
end
