class Api::V1::FavouritesController < ApplicationController

  def index
    @user_favourites = User.find(params[:user_id]).favourites
    render json: @user_favourites
  end

  def create
    @bicycle = Bicycle.find_by name: params[:name], model: params[:model], image_url: params[:image_url]

    if @bicycle
      @user_favourites = User.find(params[:user_id]).bicycles
      @user_favourites << @bicycle
      render json: @user_favourites
    else
      render json: { status: 'error', message: "can't find a Bicycle with these props" }
    end
  end

  def destroy
    @bicycle = @user_favourites.find_by bicycle_id: params[:id]
    if @bicycle
      @user_favourites = User.find(params[:user_id]).favourites
      @user_favourites.delete(@bicycle)
      render json: @user_favourites
    else
      render json: { status: 'error', message: "can't find a Bicycle with the id #{params[:id]}" }
    end
  end
end
