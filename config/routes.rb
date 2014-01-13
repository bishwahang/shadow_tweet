SampleApp::Application.routes.draw do

  resources :users do
    member do
      get :following, :followers
    end
  end
  
  resources :sessions,   only: [:new, :create, :destroy]
  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]

  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  root  'static_pages#home'
end
