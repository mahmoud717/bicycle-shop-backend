Rails.application.routes.draw do
 
    namespace :v1, :defaults => {:format => :json} do
      resources :bicycles ,  only: [:index, :show, :create, :update, :destroy]
    end
end
