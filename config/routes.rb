Rails.application.routes.draw do
  devise_for :users

  resources :pages, only: :home
  resources :stages, only: [:index, :new, :create, :edit, :update]
  resources :steps, only: [:edit, :update]
  # resources :activities, only: [:new, :create]

  get 'pages/home'

  root 'pages#home'
end
