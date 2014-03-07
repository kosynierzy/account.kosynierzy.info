require 'spec_helper'

feature 'Beanstalk monitoring' do
  let(:password) { 'password' }
  let(:user) { create(:confirmed_user, password: password) }
  let(:admin) { create(:confirmed_user, admin: true, password: password) }

  scenario 'guest enters monitor page' do
    visit '/beanstalkd'

    expect(page).to_not have_content 'Beanstalkd View'
  end

  scenario 'regular user enters monitor page' do
    sign_in_with user.email, password

    expect { visit '/beanstalkd' }.to raise_error(ActionController::RoutingError)
  end

  scenario 'admin enters monitor page' do
    sign_in_with admin.email, password
    visit '/beanstalkd'

    expect(page).to have_content 'Beanstalkd View'
  end
end
