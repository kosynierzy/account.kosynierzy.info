require 'spec_helper'

feature 'Visitor signs in' do
  let(:email) { 'valid@example.com' }
  let(:password) { 'password' }

  background do
    create(:confirmed_user, email: email, password: password)
  end

  scenario 'with valid email and password' do
    sign_in_with email, password

    expect(page).to have_text 'Zalogowano'
    expect(page).to have_button 'Wyloguj'
  end

  scenario 'with invalid password' do
    sign_in_with email, 'invalid'

    expect(page).to have_text 'Niepoprawny adres e-mail lub hasło.'
    expect(page).to have_button 'Zaloguj'
  end

  scenario 'with not existing email' do
    sign_in_with 'invalid@example.com', 'password'

    expect(page).to have_text 'Niepoprawny adres e-mail lub hasło.'
    expect(page).to have_button 'Zaloguj'
  end
end
