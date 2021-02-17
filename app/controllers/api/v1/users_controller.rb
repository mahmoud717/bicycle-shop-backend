class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])

    if @user
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
    @user = User.find(params[:id])
    @user.update(
      name: params[:name],
      email: params[:email]
    )
    if @user.save
      render json: @user
    else
      render json: { status: 'error', message: @user.errors.full_messages }
    end
  end

  def destroy
    @user = User.find(params[:id])

    if @user
      @user.destroy
      @users = User.all
      render json: @users
    else
      render json: { status: 'error', message: "can't find a user with the id #{params[:id]} " }
    end
  end
end
