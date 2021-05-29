require 'rails_helper'

describe 'the attending process', type: :feature do
  before :each do
    User.create!(name: 'NewUser', email: 'user@example.com')
    Event.create(name: 'NewEvent', info: 'Info of event', date: Date.today, creator_id: 1)
  end

  it 'checks the event existing' do
    expect(Event.first.name).to have_content 'NewEvent'
  end

  it 'add me as attendant' do
    user2 = User.create!(name: 'NewUser2', email: 'user2@example.com')
    login_as(user2, scope: :user)
    visit '/events/1'
    click_link 'Attend to this event'
    expect(page).to have_content 'Guest: NewUser2'
  end
end
