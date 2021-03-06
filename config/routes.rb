Rails.application.routes.draw do
  resources :roasts, only: [:index, :new, :create, :show, :edit, :update]
  resources :roasters, only: [:index, :show, :edit, :update, :new, :create] do
    resources :roasts, only: [:index, :show, :new]
  end
  resources :users, only: [:new, :create, :show] do
    resources :roasts, only: [:index]
  end
  
  resources :purchases, only: [:create]

  get 'login' => 'sessions#new'
  get '/auth/facebook/callback' => 'sessions#facebook_login'
  post 'sessions' => 'sessions#create'
  get 'logout' => 'sessions#destroy'

  root 'users#index'
end


# Roasts#index => /users/:id/roasts