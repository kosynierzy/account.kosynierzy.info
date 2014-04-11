require 'spec_helper'

feature 'Visitor signs up' do
  scenario 'with valid data' do
    sign_up_with 'username', 'valid@example.com', 'password', 'password'

    expect(page).to have_content 'Wiadomość z linkiem aktywacyjnym została wysłana na podany adres email. Otwórz link w celu aktywacji konta.'
  end

  scenario 'with invalid email' do
    sign_up_with 'username', 'invalid_email', 'password', 'password'

    expect(page).to have_content 'Email jest nieprawidłowe'
  end

  scenario 'with blank password' do
    sign_up_with 'username', 'valid@example.com', '', ''

    expect(page).to have_content 'Password nie może być puste'
  end

  scenario 'with passwords mismatch' do
    sign_up_with 'username', 'valid@example.com', 'password', 'password_confirmation'

    expect(page).to have_content 'Password confirmation nie zgadza się z potwierdzeniem'
  end

  scenario 'with existing email' do
    create(:user, email: 'valid@example.com')

    sign_up_with 'username', 'valid@example.com', 'password', 'password'

    expect(page).to have_content 'Email zostało już zajęte'
  end

  scenario 'with missing username' do
    sign_up_with '', 'valid@example.com', 'password', 'password'

    expect(page).to have_content 'Username nie może być puste'
  end

  scenario 'with existing username' do
    create(:user, username: 'username')

    sign_up_with 'username', 'valid@example.com', 'password', 'password'

    expect(page).to have_content 'Username zostało już zajęte'
  end
end
