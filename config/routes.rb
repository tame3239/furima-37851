Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :orders, only: [:index, :create]
  end
  resources :items do
    resources :comments, only: :create
  end
  
end
