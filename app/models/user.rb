class User < ApplicationRecord
  has_many :reviews

  has_many :hosted_events, class_name: "Event", foreign_key: 'host_id'
  has_many :attended_events, through: :guestlist, foreign_key: 'attendee_id', source: :event

  has_many :movies, through: :reviews
  has_many :comments, through: :events
end
