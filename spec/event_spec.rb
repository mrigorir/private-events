require 'rails_helper'

RSpec.describe Event, type: :model do
  it 'fails when creating an event without an user' do
    expect(Event.create(name: 'Event01', date: Date.today).errors.full_messages).to eq(['Creator must exist'])
  end

  it 'succeeds when creating an event with an user' do
    user = User.create(name: 'Person', email: 'email@email.com')
    event = Event.create(name: 'Meeting', date: '01/01/2001', creator_id: user.id)
    expect(event).to eq(Event.first)
  end
end
