Rails.application.routes.draw do
  get 'home' => 'home#index'
  root 'home#index'

  resources :users, only: [:new, :create, :edit, :update]
  resources :posts, only: [:index, :new, :create, :show, :destroy] do
    resources :comments, only: [:new, :create]
  end

  get 'login' => 'sessions#getLogin'
  post 'login' => 'sessions#postLogin'
  delete 'logout' => 'sessions#deleteLogout'
end
