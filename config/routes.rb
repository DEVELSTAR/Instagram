Rails.application.routes.draw do
  get 'search/index'
  devise_for :users
  get 'home/index'
  root 'home#index'
  get 'search' => 'search#index'

  resources :users, only: [:show, :edit, :update]

  resources :posts do
    resources :comments
  end

end
