Rails.application.routes.draw do

  devise_for :users

  resources :users, only: [:show, :edit, :update]

  root "restaurants#index"

  resources :restaurants, only: [:index, :show] do
    resources :comments, only: [:create, :destroy]

    collection do
      get :feeds
    end 

    member do
      get :dashboard
    end
  end

  resources :categories, only: :show

  namespace :admin do
    resources :restaurants
    resources :categories
    root "restaurants#index"
  end
end
