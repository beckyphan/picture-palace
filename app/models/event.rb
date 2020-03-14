class Event < ApplicationRecord
  validates_presence_of :event_title, :date_time, :movie_id
  validates :host_id, uniqueness: {scope: :date_time, message: ". You are already hosting an event at that date/time."}

  belongs_to :movie
  belongs_to :host, class_name: "User"

  has_many :comments, dependent: :destroy

  has_many :guestlists, dependent: :destroy
  has_many :attendees, through: :guestlists, foreign_key: "attendee_id"
  # foreign_key is referencing what column to look for in the Guestlist table

  def self.most_popular
    Guestlist.most_popular_event
  end
end
