require 'spec_helper'

feature 'Visitor signs up' do
  scenario 'with valid email, password and password confirmation' do
    sign_up_with 'valid@example.com', 'password', 'password'

    expect(page).to have_content 'Wiadomość z linkiem aktywacyjnym została wysłana na podany adres email. Otwórz link w celu aktywacji konta.'
  end

  scenario 'with invalid email' do
    sign_up_with 'invalid_email', 'password', 'password'

    expect(page).to have_content 'Email jest nieprawidłowe'
    expect(page).to have_content 'Sign up'
  end

  scenario 'with blank password' do
    sign_up_with 'valid@example.com', '', ''

    expect(page).to have_content 'Password nie może być puste'
    expect(page).to have_content 'Sign up'
  end

  scenario 'with passwords mismatch' do
    sign_up_with 'valid@example.com', 'password', 'password_confirmation'

    expect(page).to have_content 'Password confirmation nie zgadza się z potwierdzeniem'
    expect(page).to have_content 'Sign up'
  end

  scenario 'with existing email' do
    create(:user, email: 'valid@example.com')

    sign_up_with 'valid@example.com', 'password', 'password'

    expect(page).to have_content 'Email zostało już zajęte'
    expect(page).to have_content 'Sign up'
  end

  def sign_up_with(email, password, password_confirmation)
    visit '/users/sign_up'

    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: password_confirmation

    click_button 'Sign up'
  end
end
