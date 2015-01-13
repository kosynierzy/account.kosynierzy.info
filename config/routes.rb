require 'sidekiq/web'

Rails.application.routes.draw do
  use_doorkeeper

  namespace :api do
    namespace :v1 do
      get :me, to: 'users#me'

      resources :users, only: [:index]
    end
  end

  namespace :admin do
    root to: 'users#index'
  end

  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web, at: '/sidekiq'
  end

  devise_for :users, skip: :registrations, controllers: { sessions: 'sessions' }

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
