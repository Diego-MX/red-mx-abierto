Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "users/registrations"}
  resources :pages, only: [:home]
  resources :users
  get 'pages/home'

  resources :pages, only: :home

  resources :stages, only: :index
  match '/user_activities', to: 'user_activities#update', via: :post

  namespace :admin do
    resources :stages, only: [:index, :create, :update, :destroy] do
      resources :steps, only: [:index, :create, :update, :destroy] do
        resources :activities, only: [:index, :create, :update, :destroy]
      end
    end
    resources :tools, only: [:index, :create, :update, :destroy]
  end

  get 'pages/home'

  root 'pages#home'
end
