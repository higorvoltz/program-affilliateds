# frozen_string_literal: true

Rails.application.routes.draw do
  resources :products, only: %i[index show create update destroy]
  resources :productors, only: %i[index show create update destroy]
  resources :affiliateds, only: %i[index show create update destroy]
  resources :sales, only: %i[index show create update destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
