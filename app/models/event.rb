class Event < ApplicationRecord
  validates_presence_of :event_title, :date_time, :movie_id
  validates :host_id, uniqueness: {scope: :date_time, message: ". You already hosting an event at that date/time."}

  belongs_to :movie
  belongs_to :host, class_name: "User"

  has_many :comments

  has_many :attendees_events
  has_many :attendees, through: :attendees_events, class_name: "User"
end
