class EventAttendee < ApplicationRecord
  belongs_to :event_attendee, class_name: 'User'
  belongs_to :attended_event, class: 'Event'

  # has_many :event_attendees, foreign_key: :attendee_id, dependent: :destroy
  # has_many :attended_events, through: :event_attendees
end
