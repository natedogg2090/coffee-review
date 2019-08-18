Rails.application.routes.draw do
  resources :roasts, only: [:index, :new, :create, :show, :edit, :update]
  resources :roasters, only: [:index, :show, :edit, :update, :new, :create]
  resources :users, only: [:new, :create, :show]
end
