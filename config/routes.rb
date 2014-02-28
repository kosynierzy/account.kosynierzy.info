Kosynierzy::Application.routes.draw do
  mount BeanstalkdView::Server, at: '/beanstalkd'

  devise_for :users

  root to: 'home#index'
end
