Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'products/freight_calculating/:id', to: 'products#show'
      resources :products, only: %i[create]
    end
  end
end
