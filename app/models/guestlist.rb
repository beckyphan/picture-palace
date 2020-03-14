class Guestlist < ApplicationRecord
  belongs_to :event
  belongs_to :attendee, class_name: "User"

  scope :event_guest_counts, -> { self.group(:event_id).count }
  scope :order_events_by_popularity, -> { self.group(:event_id).order("count(*)").count }
  scope :attendee, -> (attendee_object) { where('attendee_id = ?', attendee_object.id)}

  def self.most_popular_event
    event_id = self.order_events_by_popularity.first.first
    @event = Event.find_by(id: event_id)
  end

end
