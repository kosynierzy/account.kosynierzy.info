require 'spec_helper'

feature 'User signs out' do
  background do
    create(:confirmed_user, email: 'valid@example.com', password: 'password')
    sign_in_with 'valid@example.com', 'password'
  end

  scenario 'sign out' do
    sign_out

    expect(page).to have_content 'Wylogowano pomyślnie.'
    expect(page).to have_button 'Sign in'
  end
end
