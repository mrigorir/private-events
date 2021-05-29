require 'rails_helper'

describe 'the signin process', type: :feature do
  before :each do
    User.create(name: 'NewUser', email: 'user@example.com')
  end

  it 'checks if the user exists' do
    expect(User.last.name).to have_content 'NewUser'
  end

  it 'signs me in' do
    visit '/users/sign_up'
    within('#new_user') do
      fill_in 'user_login', with: 'NewUser'
    end
    click_button 'Log in'
    expect(page).to have_content 'Welcome, NewUser'
  end
end
