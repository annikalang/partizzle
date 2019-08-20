class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end

  def new
    @locations = Location.new
  end

  def show
    @booking = Booking.new
    @location = Location.find(params[:id])
  end

  def create

  end

  def edit

  end

  def destroy

  end
end
