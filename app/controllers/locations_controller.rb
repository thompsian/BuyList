class LocationsController < ApplicationController

    def index
        locations = Location.all
        render json: locations
    end

    def show
        location = Location.find([params[:id]])
        render json: location
    end

    def create
        location = Location.create(location_params)
        if location.valid?
            render json: location
        else
            render json: location.errors
        end
    end
    
    def destroy
        location = Location.find(params[:id])
        if location.destroy
            render json: location
        else
            render json: location.errors
        end
    end

    private
    def location_params
        params.require(:location).permit(:name)
    end

end
