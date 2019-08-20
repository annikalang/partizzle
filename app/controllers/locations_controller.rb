class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
  end

  def show
    @location = Location.find(params[:id])
  end

  def create
    @user = current_user
    @location = Location.new(locations_params)
    @location.user = @user
    if @location.save!
      redirect_to location_path(@location)
    else
      render :new
    end
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])
    @location.update(locations_params)
    if @location.save
      redirect_to location_path(@location)
    else
      render :edit
    end
  end

  def destroy
   @location = Location.find(params[:id])
   @location.destroy
   redirect_to root_path
  end

  def set_params
    @location = Location.find(params[:id])
  end

   def locations_params
     params.require(:location).permit(:title, :address, :description, :size, :price, :tags, :photo)
  end
end
