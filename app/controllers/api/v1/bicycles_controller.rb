class Api::V1::BicyclesController < ApplicationController
  def index
    @bicycles = Bicycle.all
    render json: @bicycles
  end

  def show
    @bicycle = Bicycle.find(params[:id])
    if @bicycle
      render json: @bicycle
    else
      render json: { status: 'error', message: "can't find a bicycle with the id #{params[:id]}" }
    end
  end

  def create
    @bicycle = Bicycle.create(
      name: params[:name],
      model: params[:model],
      image_url: params[:image_url], 
      options: params[:options]
    )
    if @bicycle.save
      render json: @bicycle
    else
      render json: { status: 'error', message: @bicycle.errors.full_messages }
    end
  end

  def update
    @bicycle = Bicycle.find(params[:id])
    @bicycle.update(
      name: params[:name],
      model: params[:model],
      image_url: params[:image_url]
    )
    if @bicycle.save
      render json: @bicycle
    else
      render json: { status: 'error', message: @bicycle.errors.full_messages }
    end
  end

  def destroy
    @bicycles = Bicycle.all
    @bicycle = Bicycle.find(params[:id])
    if @bicycle
      @bicycle.destroy
      render json: @bicycles
    else
      render json: { status: 'error', message: "can't find a user with the id #{params[:id]}" }
    end
  end
end
