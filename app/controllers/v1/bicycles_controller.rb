class V1::BicyclesController < ApplicationController
    def index 
        @bicycles = Bicycle.all
        render json: @bicycles
    end
    def show 
        @bicycle = Bicycle.find(params[:id])
        render json: @bicycle
    end

    def create 
        @bicycle = Bicycle.create(
            name: params[:name],
            model: params[:model],
            image_url: params[:image_url]
        )
        if @bicycle.save 
            render json: @bicycle 
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
        end
    end

    def destroy
        @bicycles = Bicycle.all 
        @bicycle = Bicycle.find(params[:id])
        @bicycle.destroy
        render json: @bicycles
    end 

end
