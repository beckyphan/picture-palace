class Event < ApplicationRecord
  belongs_to :movie
  belongs_to :host, class_name: "User", foreign_key: "user_id"

  has_many :comments
  has_many :attendees, class_name: "User", foreign_key: "user_id"
end
