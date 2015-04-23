Rails.application.routes.draw do
  devise_for :users

  resources :pages, only: :home
  resources :stages, only: [:index, :new, :create]
  # resources :steps, only: [:new, :create]
  # resources :activities, only: [:new, :create]

  get 'pages/home'

  root 'pages#home'
end
