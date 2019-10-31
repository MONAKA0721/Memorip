Rails.application.routes.draw do
  get 'plans/update'

  get 'images/ogp.png', to: 'images#ogp', as: 'images_ogp'

  get 'sessions/new'

  root 'static_pages#home'

  get  '/help', to: 'static_pages#help'
  get  '/about', to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/search', to: 'users#search'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
<<<<<<< HEAD
  resources :plans, only: [:index, :update]
=======
  resources :plans, only: [:index, :update, :show]
>>>>>>> a1b578d5870ffffffd38c6c726c407efa325c990
end
