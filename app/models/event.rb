class Event < ApplicationRecord
  scope :next, -> { where('event_date >= ?', Date.today).order('event_date ASC') }
  scope :past, -> { where('event_date <  ?', Date.today).order('event_date DESC') }

  belongs_to :creator, class_name: 'User'

  has_many :event_attendees, foreign_key: :attended_event_id
  has_many :attendees, through: :event_attendees

  has_rich_text :description

  validates :description, presence: true, length: { minimum: 10, message: 'should be at least 10 characters long.' }
  validates :event_name, presence: true,
                         length: { minimum: 5, maximum: 50, message: 'Write between 5 and 50 characters.' }
  validates :event_location, presence: true,
                             length: { minimum: 2, maximum: 100, message: 'Write between 2 and 100 characters.' }
  validates :event_date, presence: true
end
