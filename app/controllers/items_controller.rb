class ItemsController < ApplicationController

    def index
        items = Item.all
        render json: items
    end

    def show
        item = Item.find([params[:id]])
        render json: item
    end

    def create
        item = Item.create(item_params)
        if item.valid?
            render json: item
        else
            render json: item.errors
        end
    end
    
    def destroy
        item = Item.find(params[:id])
        if item.destroy
            render json: item
        else
            render json: item.errors
        end
    end

    private
    def location_params
        params.require(:item).permit(:name, :category, :location_id)
    end

end
