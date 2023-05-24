# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :products, only: %i[index show create update destroy]
    end
  end

  namespace :api do
    namespace :v1 do
      resources :affiliateds, only: %i[index show create update destroy]
    end
  end

  namespace :api do
    namespace :v1 do
      resources :productors, only: %i[index show create update destroy]
    end
  end

  namespace :api do
    namespace :v1 do
      resources :sales, only: %i[index show create update]
    end
  end
  resources :sale_items, only: %i[index show create update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
