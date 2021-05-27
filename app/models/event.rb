class Event < ApplicationRecord
  
  # validates :event_name, presence: { message: 'is required.' },
  #                 length: { in: 2..20, message: 'should be from 3 to 20 characters long.' }
  # validates :event_location, presence: { message: 'is required' }, length: { maximum: 50, message: 'Write until 50 characters please.' }
  validates :description, presence: { message: 'is required.' },
                    length: { minimum: 10 , message: 'should be at least 10 characters long.' }
  has_rich_text :description

  belongs_to 	:creator, :class_name => "User"
  
end
