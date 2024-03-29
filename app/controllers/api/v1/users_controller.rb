class Api::V1::UsersController < ApplicationController
  before_action :authorized, except: [:create]
  def index
    @users = User.all
    render json: @users
  end

  def search_user
    @user = User.find_by email: params[:email]
    if @user
      render json: @user
    else
      render json: { status: 'error', message: "can't find a user with the email #{params[:email]} " }
    end
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
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      image_url: params[:image_url]
    )
    if @user.save
      session[:user_id] = @user.id,
                          token = encode_token({ user_id: @user.id })
      render json: {
        status: :created,
        user: @user,
        orders: [],
        token: token
      }
    else
      render json: { status: 'error', message: @user.errors.full_messages }
    end
  end

  def update
    @user = User.find(params[:id])
    if @user
      @user.update(
        name: params[:name],
        email: params[:email],
        password: params[:password],
        password_confirmation: params[:password_confirmation],
        image_url: params[:image_url]
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
    @user = User.find(params[:id])
    if @user
      @user.destroy
      render json: { status: 'success' }
    else
      render json: { status: 'error', message: "can't find a user with the id #{params[:id]} " }
    end
  end

  def user_orders
    @user = User.find(params[:id])
    if @user
      @orders = @user.orders
      render json: @orders
    else
      render json: { status: 'error', message: "can't find a user with the id #{params[:id]} " }
    end
  end
end
