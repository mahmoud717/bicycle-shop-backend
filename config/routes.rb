Rails.application.routes.draw do
    namespace :api do 
      namespace :v1, :defaults => {:format => :json} do
        resources :bicycles ,  only: [:index, :show, :create, :update, :destroy]
        resources :users ,  only: [:index, :show, :create, :update, :destroy] do 
            resources :favourites, only: [:index, :create, :destroy]
        end
      end
    end
end
