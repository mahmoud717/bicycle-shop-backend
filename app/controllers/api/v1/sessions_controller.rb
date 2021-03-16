class Api::V1::SessionsController < ApplicationController
    include CurrentUserConcern
    def create
        @user = User.find_by(email: params[:email])
        .try(:authenticate, params[:password])
        if @user 
            session[:user_id]  = @user.id
            token = encode_token({user_id: @user.id})
            render json: {
                status: :created,
                logged_in: true,
                user: @user,
                orders: @user.orders,
                session: session[:user_id],
                token: token
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
        if check_logged_in
            render json: {
                logged_in: true,
                user: logged_in_user,
                orders: logged_in_user.orders
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