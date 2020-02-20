class Event < ApplicationRecord
  belongs_to :movie
  belongs_to :host, class_name: "User", foreign_key: "host_id"

  has_many :comments
  has_many :attendees, through: :guestlist, foreign_key: "attendee_id", source: "user"
end
