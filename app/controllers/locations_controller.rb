class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end

  def new
    @locations = Location.new
  end

  def create

  end

  def edit

  end

  def destroy

  end
end
