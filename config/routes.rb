Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "users/registrations"}
  resources :pages, only: [:home]
  resources :users
  get 'pages/home'

  resources :pages, only: :home

  resources :stages, only: :index
  match '/user_activities', to: 'user_activities#update', via: :post

  namespace :admin do
    resources :stages, only: [:index, :create, :update] do
      resources :steps, only: [:index, :create, :update] do
        resources :activities, only: [:index, :create, :update]
      end
    end
  end

  get 'pages/home'

  root 'pages#home'
end
