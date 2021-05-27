class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, foreign_key: :creator_id, class_name: 'Event', dependent: :destroy
  
  has_many :event_attendees, foreign_key: :attendee_id, dependent: :destroy
  has_many :attended_events, through: :event_attendees

  def attending?(event)
    event.attendees.include?(self)
  end

  def attend!(event)
    event_attendees.create!(attended_event_id: event.id)
  end

  def cancel!(event)
    event_attendees.find_by(attended_event_id: event.id).destroy
  end 
end
