class Event < ApplicationRecord
  
  validates :event_name, presence: { message: 'is required.' },
                    length: { in: 2..20, message: 'should be from 3 to 20 characters long.' }
  validates :event_location, presence: { message: 'is required' }, length: { maximum: 50, message: 'Write until 50 characters please.' }
  
  belongs_to 	:creator, :class_name => "User"
  
end
