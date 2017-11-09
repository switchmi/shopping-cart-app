Rails.application.routes.draw do
  devise_for :admins
  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  namespace :admin do
    root to: 'categories#new'
    resources :categories, only: [:new, :create, :destroy]
  end
end
