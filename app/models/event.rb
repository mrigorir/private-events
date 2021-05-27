class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'

  has_many :event_attendees, foreign_key: :attended_event_id
  has_many :attendees, through: :event_attendees

  has_rich_text :description

  validates :description, presence: { message: 'is required.' },
                    length: { minimum: 10 , message: 'should be at least 10 characters long.' }
end
