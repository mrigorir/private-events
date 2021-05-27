class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, foreign_key: :creator_id, dependent: :destroy
  has_many :event_attendees, foreign_key: :attendee_id, dependent: :destroy
  has_many :attended_events, through: :event_attendees
end
