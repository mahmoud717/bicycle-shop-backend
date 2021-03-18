class Api::V1::FavouritesController < ApplicationController

  def index
    @user_favourites = User.find(params[:user_id]).favourites
    @user_fav_bikes = []

    bike_Ids = []
    if @user_favourites.length
      @user_favourites.each do |el|
      bike_Ids.push(el.bicycle_id)
      end
    end

    if bike_Ids.length
      bike_Ids.each do |el|
        @user_fav_bikes.push(Bicycle.find(el))
      end
    end
    render json: @user_fav_bikes
  end

  def show 
    @user_favourites = User.find(params[:user_id]).favourites
    @bike = @userFavourites.fine(params[:id])
    if @bike 
      render json: { status: true, bike: @bike}
    else
      render json: {status: false}
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
    @bicycle = @user_favourites.find  params[:bicycle_id]
    if @bicycle
      @user_favourites = User.find(params[:user_id]).favourites
      @user_favourites.delete(@bicycle)
      render json: @user_favourites
    else
      render json: { status: 'error', message: "can't find a Bicycle with the id #{params[:id]}" }
    end
  end
end
