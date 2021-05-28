require 'rails_helper'

RSpec.describe 'Siggin Up', type: :feature do
  scenario 'Sign up with valid inputs' do
    visit new_user_registration_path
    fill_in 'name', with: 'Marco'
    fill_in 'email', with: 'test@gmail.com'
    fill_in 'password', with: '123456'
    fill_in 'password confirmation', with: '123456'
    click_on 'Sign up'
    sleep(3)
    visit root_path
    expect(page).to have_content('Marco')
  end

  scenario 'Sign up with invalid inputs' do
    visit new_user_registration_path
    fill_in 'name', with: ''
    fill_in 'email', with: 'testgmail.com'
    fill_in 'password', with: '123456'
    fill_in 'password confirmation', with: '1234567'
    click_on 'Sign up'
    sleep(3)
    visit root_path
    expect(page).to_not have_content('Marco')
  end
end

RSpec.describe 'Loggin In', type: :feature do
  let(:user) { User.create(name: 'Marco', email: 'test@gmail.com', password: '123456') }
  scenario 'Log in with valid inputs' do
    visit new_user_session_path
    fill_in 'email', with: user.email
    fill_in 'password', with: user.password
    click_on 'Log in'
    sleep(3)
    expect(page).to have_content('Marco')
  end

  scenario 'Log in with invalid inputs' do
    visit new_user_session_path
    fill_in 'email', with: 'Banana'
    fill_in 'password', with: user.password
    click_on 'Log in'
    sleep(3)
    expect(page).to_not have_content('Marco')
  end
end