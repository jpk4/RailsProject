# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'houses#index'

  resources 'houses', only: %i[index show]
  resources 'seats', only: %i[index show]
  resources 'characters', only: %i[index show]
  resources 'aliases', only: %i[index show]
  resources 'books', only: %i[index show]
  resources 'titles', only: %i[index show]
  resources :pages

  get ':permalink', to: 'pages#permalink', as: 'permalink'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
