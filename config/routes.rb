Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :products, only: %i[create show]
    end
  end
end
