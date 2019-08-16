Rails.application.routes.draw do
  resources :roasts, only: [:index, :new]
end
