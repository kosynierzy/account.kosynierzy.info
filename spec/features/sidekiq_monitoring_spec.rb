require 'spec_helper'

feature 'Sidekiq monitoring' do
  let(:password) { 'password' }
  let(:user) { create(:confirmed_user, password: password) }
  let(:admin) { create(:confirmed_user, roles: ['admin'], password: password) }

  scenario 'guest enters monitor page' do
    visit '/sidekiq'

    expect(page).to_not have_content 'Sidekiq v3'
  end

  scenario 'regular user enters monitor page' do
    sign_in_with user.email, password

    expect { visit '/sidekiq' }.to raise_error(ActionController::RoutingError)
  end

  scenario 'admin enters monitor page' do
    sign_in_with admin.email, password
    visit '/sidekiq'

    expect(page).to have_content 'Sidekiq v3'
  end
end
