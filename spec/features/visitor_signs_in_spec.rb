require 'spec_helper'

feature 'Visitor signs in' do
  let(:email) { 'valid@example.com' }
  let(:password) { 'password' }

  background do
    create(:confirmed_user, email: email, password: password)
  end

  scenario 'with valid email and password' do
    sign_in_with email, password

    expect(page).to have_content 'Zalogowano'
    expect(page).to have_button 'Sign out'
  end

  scenario 'with invalid password' do
    sign_in_with email, 'invalid'

    expect(page).to have_content 'Niepoprawny adres email lub hasło.'
    expect(page).to have_button 'Sign in'
  end

  scenario 'with not existing email' do
    sign_in_with 'invalid@example.com', 'password'

    expect(page).to have_content 'Nieprawidłowa nazwa użytkownika lub hasło.'
    expect(page).to have_button 'Sign in'
  end
end
