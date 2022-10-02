Rails.application.routes.draw do
  resources :follows
  get 'search/index'
  devise_for :users
  get 'home/index'
  root 'home#index'
  get 'search' => 'search#index'

  resources :users, only: [:show, :edit, :update]

  resources :posts do
    resources :comments
  end
  
  resources :likes, only: [:create, :destroy]

  post '/users/:id/follow', to: "users#follow", as: "follow_user"
  post '/users/:id/unfollow', to: "users#unfollow", as: "unfollow_user"

  resources :statuses, only: [:show, :new, :create, :destroy]

end
