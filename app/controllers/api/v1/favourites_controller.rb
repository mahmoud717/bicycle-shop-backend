class Api::V1::FavouritesController < ApplicationController
  def index
    @user_favourites = User.find(params[:user_id]).favourites
    @user_fav_bikes = []

    bike_ids = []
    if @user_favourites.length
      @user_favourites.each do |el|
      bike_ids.push(el.bicycle_id)
      end
    end

    if bike_ids.length
      bike_ids.each do |el|
        @user_fav_bikes.push(Bicycle.find(el))
      end
    end
    render json: @user_fav_bikes
  end

  def show
    @user_favourites = User.find(params[:user_id]).favourites
    @bike = @user_favourites.find_by(user_id: params[:user_id], bicycle_id: params[:id]) if @user_favourites
    if @bike
      render json: { status: true }
    else
      render json: { status: false }
    end
  end

  def create
    @bicycle = Bicycle.find params[:bicycle_id]
    if @bicycle
      @user_favourites = User.find(params[:user_id]).bicycles
      @user_favourites << @bicycle
      render json: @user_favourites
    else
      render json: { status: 'error', message: "can't find a Bicycle with these props" }
    end
  end

  def destroy
    @user_favourites = User.find(params[:user_id]).favourites
    @bicycle = @user_favourites.find_by(user_id: params[:user_id], bicycle_id: params[:id]) if @user_favourites
    if @bicycle
      @user_favourites.delete(@bicycle.id)
      render json: @user_favourites
    else
      render json: { status: 'error', message: "can't find a Bicycle with the id #{params[:id]}" }
    end
  end
end
