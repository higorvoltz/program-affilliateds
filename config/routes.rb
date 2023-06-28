# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :api do
    namespace :v1 do
      resources :products, only: %i[index show create update]
    end
  end

  namespace :api do
    namespace :v1 do
      resources :affiliateds, only: %i[index show create update destroy]
      get 'affiliateds/search_by_name/:name', to: 'affiliateds#show_by_name'
    end
  end

  namespace :api do
    namespace :v1 do
      resources :productors, only: %i[index show create update destroy]
      get 'productors/by-name/:name', to: 'productors#show_by_name'
    end
  end

  namespace :api do
    namespace :v1 do
      get '/sales/report-affiliateds-last-sales-balance', to: 'sales#report_affiliateds_last_sales_balance'
      resources :sales, only: %i[index create update]
      get '/sales/:id/show', to: 'sales#show'
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

  namespace :api do
    namespace :v1 do
      resources :clients, only: %i[index show create update destroy], path: '/clients'
      get 'clients/by-name/:name', to: 'clients#show_by_name'
    end
  end

  namespace :api do
    namespace :v1 do
      resources :product_rankings, only: %i[index show create update destroy], path: '/product-rankings'
    end
  end

  namespace :api do
    namespace :v2 do
      resources :clients, only: %i[index show create update destroy], path: '/clients'
    end
  end

  namespace :api do
    namespace :v1 do
      post 'login-productor', to: 'sessions#create_productor'
    end
  end

  namespace :api do
    namespace :v1 do
      post 'login-affiliated', to: 'sessions#create_affiliated'
    end
  end

  namespace :api do
    namespace :v1 do
      post 'login-client', to: 'sessions#create_client'
    end
  end

  namespace :api do
    namespace :v1 do
      post '/send_email', to: 'promotion_email#send_email'
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
