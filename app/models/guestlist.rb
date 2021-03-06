class Guestlist < ApplicationRecord
  belongs_to :event
  belongs_to :attendee, class_name: "User"
  
  validate :not_attending_as_host
  validate :past_event_error

  scope :event_guest_counts, -> { self.group(:event_id).count }
  scope :order_events_by_popularity, -> { self.group(:event_id).order("count(*)").count }
  scope :attendee, -> (attendee_object) { where('attendee_id = ?', attendee_object.id)}

  def self.most_popular_event
    event_id = self.order_events_by_popularity.first.first
    @event = Event.find_by(id: event_id)
  end

  def host?
    self.attendee == self.event.host
  end

  def not_attending_as_host
    if self.host?
      errors.add(:attendee_id, "cannot be the same as host.")
    end
  end

  def past_event_error
    if self.event.date_time < Time.now
      errors.add(:event_id, "has already occurred.")
    end
  end

end
