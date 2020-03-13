# frozen_string_literal: true

Rails.application.routes.draw do
  get 'aliases/index'
  get 'aliases/show'
  root to: 'houses#index'

  resources 'houses', only: %i[index show]
  resources 'seats', only: %i[index show]
  resources 'characters', only: %i[index show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
