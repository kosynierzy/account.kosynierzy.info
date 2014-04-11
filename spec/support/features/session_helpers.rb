module Features
  module SessionHelpers
    def sign_in_with(email, password)
      visit '/'

      fill_in 'Email', with: email
      fill_in 'Hasło', with: password

      click_button 'Zaloguj'
    end

    def sign_up_with(username, email, password, password_confirmation)
      visit '/users/sign_up'

      fill_in 'Nazwa użytkownika', with: username
      fill_in 'Email', with: email
      fill_in 'Hasło', with: password
      fill_in 'Powtórz hasło', with: password_confirmation

      click_button 'Załóż konto'
    end

    def sign_out
      page.click_button 'Wyloguj'
    end
  end
end
