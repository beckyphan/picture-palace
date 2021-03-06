class User < ApplicationRecord
  has_secure_password
  validates_presence_of :name, :username, :email
  validates_uniqueness_of :username, :email

  has_many :reviews, dependent: :destroy

  has_many :events, foreign_key: 'host_id', dependent: :destroy
  # event.host => user
  # foreign_key is referencing what column to look for in the Event table

  has_many :guestlists, foreign_key: 'attendee_id', dependent: :destroy
  # has_many :events, through: :guestlists, foreign_key: 'attendee_id' # commented out this line, as it seems rails confuses the two different has_many :events and is unable to build an event for a user/host however is able to build guestlists for user/attendee without this line
  #guestlist.attendee => user
  # foreign_key is referencing what column to look for in the Guestlist table

  has_many :movies, through: :reviews
  has_many :comments, dependent: :destroy

end
