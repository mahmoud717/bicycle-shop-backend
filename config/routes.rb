Rails.application.routes.draw do
    namespace :api do 
      namespace :v1, :defaults => {:format => :json} do
        resources :bicycles ,  only: [:index, :show, :create, :update, :destroy]
        resources :users ,  only: [:index, :show, :create, :update, :destroy] do 
            resources :favourites, only: [:index, :create, :destroy]
        end
        resources :orders, only: [:index, :show, :create, :update, :destroy]
      end
    end
    get 'api/v1/users/:id/orders', to: 'api/v1/users#user_orders'
    get 'api/v1/bicycles/:id/orders', to: 'api/v1/bicycles#bicycle_orders'
end
