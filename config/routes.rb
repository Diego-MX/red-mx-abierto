Rails.application.routes.draw do
  devise_for :users

  resources :pages, only: :home
  resources :stages, only: [:index, :new, :create, :edit, :update] do
    resources :steps, only: [:index, :new, :create, :edit, :update] do
      resources :activities, only: [:index, :new, :create, :edit, :update]
    end
  end
  # resources :activities, only: [:new, :create]

  get 'pages/home'

  root 'pages#home'
end
