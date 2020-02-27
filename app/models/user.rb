class User < ApplicationRecord
  has_secure_password
  validates_presence_of :name, :username, :email, :password
  validates_uniqueness_of :username, :email

  has_many :reviews

  has_many :events, foreign_key: 'host_id' # host.events
  # foreign_key is referencing what column to look for in the User table

  has_many :events, through: :attendees_events, foreign_key: 'attendee_id' #user.events
  # foreign_key is referencing what column to look for in the Attendees_Events table

  has_many :movies, through: :reviews
  has_many :comments, through: :events
end
