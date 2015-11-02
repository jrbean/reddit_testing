Rails.application.routes.draw do

  resources :posts do
    resources :votes, only: [:create, :edit, :destroy]
  end

  resources :comments

  get 'users/profile'

  devise_for :users

root to: "posts#index"


end
