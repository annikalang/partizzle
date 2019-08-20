class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end
  def new
    @locations = Location.new
  end
  def show
    @location = Location.find(params[:id])
    @user = @location.user
  end
  def create
     @location = Location.find(params[:id])
     @location = Location.new(locations_params)
     @location.save
  end
  def edit
  end
  def destroy
  end
  def set_params
    @location = Location.find(params[:id])
  end
   def locations_params
    params.require(:location).permit(:title, :address, :description, :size,:price,:tags)
  end
end
