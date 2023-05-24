# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
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

  namespace :api do
    namespace :v1 do
      resources :sale_items, only: %i[index show create update], path: '/sale-items'
    end
  end

  namespace :api do
    namespace :v1 do
      resources :productor_affiliateds, only: %i[index show create update destroy], path: '/productor-affiliateds'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
