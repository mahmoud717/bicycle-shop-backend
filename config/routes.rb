Rails.application.routes.draw do
    namespace :api do 
      namespace :v1, :defaults => {:format => :json} do
        resources :bicycles ,  only: [:index, :show, :create, :update, :destroy]
        resources :users ,  only: [:index, :show, :create, :update, :destroy] do 
            resources :favourites, only: [:index, :create, :destroy]
        end
        resources :sessions , only: [:create]
        resources :orders, only: [:index, :show, :create, :update, :destroy]
      end
    end

    # log the user out and destroy the cookie (the cookie deletion is in the frontend part)
    delete 'api/v1/sessions/logout', to: 'api/v1/sessions#logout'

    # get all orders made by user
    get 'api/v1/users/:id/orders', to: 'api/v1/users#user_orders'
    
    # check if the user is logged in throw the JWT cookie
    get 'api/v1/sessions/logged_in', to: 'api/v1/sessions#logged_in'

    # get bicycle options and orders
    get 'api/v1/bicycles/:id/options', to: 'api/v1/bicycles#bicycle_options'
    get 'api/v1/bicycles/:id/orders', to: 'api/v1/bicycles#bicycle_orders'

    # create an option
    post 'api/v1/bicycles/:id/createOption', to: 'api/v1/bicycles#create_option'
end
