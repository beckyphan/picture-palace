class Comment < ApplicationRecord
  validates_presence_of :note
  belongs_to :event
  belongs_to :user
end
