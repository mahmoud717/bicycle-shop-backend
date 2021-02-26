class Api::V1::SessionsController < ApplicationController
    include CurrentUserConcern
    def create
        @user = User.find_by(email: params[:email])
        .try(:authenticate, params[:password])

        if @user 
            session[:user_id]  = @user.id
            render json: {
                status: :created,
                logged_in: true,
                user: @user,
                orders: @user.orders,
                session: session[:user_id]
            }
        else
            render json: {status: 404}
        end
    end

    def logout 
        reset_session
        render json: {
            logged_in: false
        }
    end
    def logged_in 
        if @current_user
            
            render json: {
                logged_in: true,
                user: @current_user,
                orders: @current_user.orders
            }
        else
            render json: {
                user: {},
                logged_in: false,
                orders: {}
            }
        end
    end
end