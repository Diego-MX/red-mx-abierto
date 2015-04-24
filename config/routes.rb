Rails.application.routes.draw do
  devise_for :users

  resources :pages, only: :home
  namespace :admin do
    resources :stages, only: [:index, :create, :update] do
      resources :steps, only: [:index, :create, :update] do
        resources :activities, only: [:index, :create, :update]
      end
    end
  end

  resources :stages, only: [:index]

  get 'pages/home'

  root 'pages#home'
end
