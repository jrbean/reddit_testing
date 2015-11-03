Rails.application.routes.draw do

  resources :posts do
    resources :votes, only: [:create]
  end

  resources :posts do
    resources :comments
  end

  get 'users/profile'

  devise_for :users

root to: "posts#index"


end
