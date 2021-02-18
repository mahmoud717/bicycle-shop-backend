class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def show
    if @user = User.find(params[:id])
      render json: @user
    else
      render json: { status: 'error', message: "can't find a user with the id #{params[:id]} " }
    end
  end

  def create
    @user = User.create(
      name: params[:name],
      email: params[:email]
    )
    if @user.save
      render json: @user
    else
      render json: { status: 'error', message: @user.errors.full_messages }
    end
  end

  def update
    if @user = User.find(params[:id])
      @user.update(
        name: params[:name],
        email: params[:email]
      )
      if @user.save
        render json: @user
      else
        render json: { status: 'error', message: @user.errors.full_messages }
      end
    else 
      render json: { status: 'error', message: "can't find a user with the id #{params[:id]} " }
    end
  end

  def destroy
    if @user = User.find(params[:id])
      @user.destroy
      render json: {status: "success"}
    else
      render json: { status: 'error', message: "can't find a user with the id #{params[:id]} " }
    end
  end

  def user_orders
    if @user = User.find(params[:id])
      @orders = @user.orders
      render json: @orders
    else 
      render json: { status: 'error', message: "can't find a user with the id #{params[:id]} " }
    end
  end
end
