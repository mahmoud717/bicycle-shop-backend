class Api::V1::BicyclesController < ApplicationController

  def index
    @bicycles = Bicycle.all
    render json: { bicycles: @bicycles, count: @bicycles.count }
  end

  def show
    @bicycle = Bicycle.find(params[:id])
    if @bicycle
      render json: {bicycle: @bicycle, options: @bicycle.options}
    else
      render json: { status: 'error', message: "can't find a bicycle with the id #{params[:id]}" }
    end
  end

  def create
    @bicycle = Bicycle.new(
      name: params[:name],
      model: params[:model],
      image_url: params[:image_url], 
      description: params[:description]
    )
    if @bicycle.save
      render json: @bicycle
    else
      render json: { status: 'error', message: @bicycle.errors.full_messages }
    end
  end

  def update
    if @bicycle = Bicycle.find(params[:id])
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
    else
      render json: { status: 'error', message: "can't find a bicycle with the id #{params[:id]}" }
    end
  end

  def destroy
    @bicycles = Bicycle.all
    @bicycle = Bicycle.find(params[:id])
    if @bicycle
      @bicycle.destroy
      render json: {status: 'success'}
    else
      render json: { status: 'error', message: "can't find a user with the id #{params[:id]}" }
    end
  end

  def bicycle_options
    @bicycle = Bicycle.find(params[:id])
    if @bicycle
      render json: @bicycle.options
    else
      render json: { status: 'error', message: "can't find a bicycle with the id #{params[:id]}" }
    end
  end

  def bicycle_orders
    if @bicycle = Bicycle.find(params[:id])
      @orders = @bicycle.orders
      render json: @orders
    else
      render json: { status: 'error', message: "can't find a user with the id #{params[:id]}" }
    end
  end

  def create_option 
    @level = 1
    @parent_id = nil
    if params[:parent_id] != nil && params[:parent_id] != ""
      @parent_id = params[:parent_id]
      @parent = Option.find(@parent_id)
      @level = @parent.level + 1 
    end
      @option = Option.new(
        name: params[:name],
        value: params[:value],
        parent_id: @parent_id,
        level: @level,
        bicycle_id: params[:bicycle_id]
      )
      if @option.save
        @bicycle = Bicycle.find(params[:id])
        render json: {status: 'success', options: @bicycle.options }
      else 
        render json: { status: 'error', message: "can't create the option" }
      end
    
  end
end
