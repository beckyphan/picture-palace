class User < ApplicationRecord
  has_many :reviews

  has_many :hosted_events, class_name: "Event"
  has_many :attended_events, class_name: "Event"

  has_many :movies, through: :reviews
  has_many :comments, through: :events
end
