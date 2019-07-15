Rails.application.routes.draw do
  get 'maps/index', to: 'maps#index'

  get 'images/ogp.png', to: 'images#ogp', as: 'images_ogp'

  get 'planning/top'

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
  resources :maps, only: [:index]
  
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
