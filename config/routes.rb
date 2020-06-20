# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'movies#index'
  resources :movies, only: %w[show index]
  resources :categories, only: %w[show index]

  get :search, to: 'movies#search'

  resources :comments, only: [:create]
end
