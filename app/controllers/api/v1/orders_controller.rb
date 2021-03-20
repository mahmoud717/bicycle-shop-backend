class Api::V1::OrdersController < ApplicationController
  def index
    @orders = Order.all
    render json: @orders
  end

  def show
    @order = Order.find(params[:id])
    if @order
      render json: @order
    else
      render json: { status: 'error', message: "can't find an order with the Id #{params[:id]}" }
    end
  end

  def create
    @order = Order.create(
      user_id: params[:user_id],
      bicycle_id: params[:bicycle_id],
      product_name: params[:product_name],
      product_image_url: params[:product_image_url],
      options: params[:options]
    )

    if @order.save
      @user = User.find(params[:user_id])
      render json: { status: 'success', orders: @user.orders }
    else
      render json: { status: 'error', message: @order.errors.full_messages }
    end
  end

  def update
    @order = Order.find(params[:id])
    if @order
      @order.update(
        user_id: params[:user_id],
        bicycle_id: params[:bicycle_id],
        product_name: params[:product_name],
        product_image_url: params[:product_image_url],
        options: params[:options]
      )
      if @order.save
        render json: @order
      else
        render json: { status: 'error', message: @order.errors.full_messages }
      end
    else
      render json: { status: 'error', message: "can't find an order with the Id #{params[:id]}" }
    end
  end

  def destroy
    @order = Order.find(params[:id])
    if @order
      order.destroy
      render json: { status: 'success' }
    else
      render json: { status: 'error', message: "can't find an order with the Id #{params[:id]}" }
    end
  end
end
