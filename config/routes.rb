Kosynierzy::Application.routes.draw do
  mount BeanstalkdView::Server, at: '/beanstalkd'

  devise_for :users, skip: :registrations

  devise_scope :user do
    resource :registration,
      only: [:new, :create, :edit, :update],
      path: 'users',
      path_names: { new: 'sign_up' },
      controller: 'devise/registrations',
      as: :user_registration do
        get :cancel
      end

    authenticated :user do
      root to: 'devise/registrations#edit', as: :authenticated_user
    end

    root to: 'devise/sessions#new'
  end
end
