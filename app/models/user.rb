class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :created_events, foreign_key: :creator_id, class_name: 'Event', dependent: :destroy
  
  has_many :event_attendees, foreign_key: :attendee_id, dependent: :destroy
  has_many :attended_events, through: :event_attendees

  validates :name, length: { maximum: 20 }, uniqueness: { case_sensitive: false }

  def attending?(event)
    event.attendees.include?(self)
  end

  def attend!(event)
    self.event_attendees.create(attended_event_id: event.id)
  end

  def cancel!(event)
    event_attendees.find_by(attended_event_id: event.id).destroy
  end
end
