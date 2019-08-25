Rails.application.routes.draw do
  resources :roasts, only: [:index, :new, :create, :show, :edit, :update]
  resources :roasters, only: [:index, :show, :edit, :update, :new, :create]
  resources :users, only: [:new, :create, :show]
  resources :purchases, only: [:create]

  get 'login' => 'sessions#new'
  get '/auth/facebook/callback' => 'sessions#create'
  post 'sessions' => 'sessions#create'
  get 'logout' => 'sessions#destroy'

  root 'users#index'
end
