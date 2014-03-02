Kosynierzy::Application.routes.draw do
  mount BeanstalkdView::Server, at: '/beanstalkd'

  devise_for :users

  devise_scope :user do
    authenticated :user do
      root to: 'devise/registrations#edit', as: :authenticated_user
    end

    root to: 'devise/sessions#new'
  end
end
