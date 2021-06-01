require 'rails_helper'

describe User, type: :feature do
  it 'Signes up with valid inputs' do
    visit 'users/sign_up'
    fill_in 'user_name', with: 'Marco'
    fill_in 'user_email', with: 'test@gmail.com'
    fill_in 'user_password', with: '123456'
    fill_in 'user_password_confirmation', with: '123456'
    click_on 'Sign up'
    sleep(3)
    visit root_path
    expect(page).to have_content('Marco')
  end

  it 'Sign up with invalid inputs' do
    visit new_user_registration_path
    fill_in 'user_name', with: ''
    fill_in 'user_email', with: 'testgmail.com'
    fill_in 'user_password', with: '123456'
    fill_in 'user_password_confirmation', with: '1234567'
    click_on 'Sign up'
    sleep(3)
    visit root_path
    expect(page).to_not have_content('Marco')
  end

  let(:user) { User.create(name: 'Marco', email: 'test@gmail.com', password: '123456') }
  scenario 'Log in with valid inputs' do
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_on 'Log in'
    sleep(3)
    expect(page).to have_content('Marco')
  end

  scenario 'Log in with invalid inputs' do
    visit new_user_session_path
    fill_in 'user_email', with: 'Banana'
    fill_in 'user_password', with: user.password
    click_on 'Log in'
    sleep(3)
    expect(page).to_not have_content('Marco')
  end
end
