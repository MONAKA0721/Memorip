Rails.application.routes.draw do
  get 'sitemap', to: redirect('http://s3-ap-northeast-1.amazonaws.com/'+ENV['S3_BUCKET']+'/sitemaps/sitemap.xml.gz')

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
  get '/planup', to: 'plans#new'
  post '/planup', to: 'plans#create'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
  resources :plans, only: [:index, :update, :show, :edit, :new, :create]
end
