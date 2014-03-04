module Features
  module SessionHelpers
    def sign_in_with(email, password)
      visit '/'

      fill_in 'Email', with: email
      fill_in 'Password', with: password

      click_button 'Sign in'
    end

    def sign_up_with(email, password, password_confirmation)
      visit '/users/sign_up'

      fill_in 'Email', with: email
      fill_in 'Password', with: password
      fill_in 'Password confirmation', with: password_confirmation

      click_button 'Sign up'
    end

    def sign_out
      page.click_button 'Sign out'
    end
  end
end
