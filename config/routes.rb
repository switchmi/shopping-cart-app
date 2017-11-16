Rails.application.routes.draw do
  get 'transactions/new'

  get 'transactions/create'

  get 'carts/show'

  devise_for :admins
  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register'}, controllers: { omniauth_callbacks: "users/omniauth_callbacks"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  namespace :admin do
    root to: 'categories#new'
    resources :categories, param: :name, only: [:new, :create, :show, :destroy] do
      resources :products do
        resources :photos
      end
    end
  end
  resources :categories, param: :name, only: [:index, :show]
  resources :products, only: [:show]
  get 'search_products', to: "products#search"
  get 'cart', to: 'cart#show'
  put 'cart/add/:product_id', to: 'cart#add', as: :add_to
  put 'cart/remove/:product_id', to: 'cart#remove', as: :remove_from

  resources :transactions, only: [:new, :create]
end
