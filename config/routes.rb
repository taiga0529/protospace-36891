Rails.application.routes.draw do

  devise_for :users
   root to:'prototypes#index'
  #  resources :tweets, only: [:index, :new]
  #resources :prototypes, only: :index,:show,:create,:update

   resources :prototypes, only: [:create,:show,:edit,:update,:new,:destroy] do
     resources :comments, only: :create
  end

  resources :users, only: :show
end
