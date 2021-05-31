require 'rails_helper'

RSpec.describe Event, type: :model do
  it 'fails when creating an event without an user' do
    expect(Event.create(event_name: 'Event02',
                        event_date: Date.today).errors.full_messages.first).to eq('Creator must exist')
  end

  it 'succeeds when creating an event with a user' do
    # user = User.create(name: 'Person')
    user = User.create(name: 'User', email: 'example2@example.com', password: '123456', password_confirmation: '123456')
    event = Event.new(event_name: 'Meeting', event_date: '01/01/2001', event_location: 'home', creator_id: user.id,
                      description: 'asdasdasdasdasdasdasd')
    event.save
    expect(event).to eq(Event.first)
  end

  it 'it successfully destroys an event' do
    user = User.create(name: 'Person')
    event = Event.create(event_name: 'Meeting', event_date: '01/01/2001', creator: user.id)
    event.destroy
    expect(event).not_to eq(Event.first)
  end
end
