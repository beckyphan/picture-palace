class Event < ApplicationRecord
  validates_presence_of :event_title, :date_time, :movie_id
  validates :host_id, uniqueness: {scope: :date_time, message: ". You already hosting an event at that date/time."}

  belongs_to :movie
  belongs_to :host, class_name: "User", foreign_key: "host_id"

  has_many :comments
  has_many :attendees, through: :guestlist, foreign_key: "attendee_id", source: "user"
end
