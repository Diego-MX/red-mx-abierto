Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "users/registrations"}
  resources :users, except: :destroy

  resources :pages, only: :home
  resources :members, only: :index
  get 'pages/home'


  resources :stages, only: :index
  match '/user_activities', to: 'user_activities#update', via: :post

  namespace :admin do
    resources :stages, only: [:index, :create, :update, :destroy] do
      resources :steps, only: [:index, :create, :update, :destroy] do
        resources :activities, only: [:index, :create, :update, :destroy]
      end
    end
    resources :tools, only: [:index, :new, :create, :edit, :update, :destroy]
  end

  get 'pages/home'
  get 'pages/conditions' 

  root 'pages#home'
end
