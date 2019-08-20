class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def create
    @booking = Booking.new(create_params)
    @location = Location.find(params[:location_id])
    @booking.location = @location
    @booking.user = current_user
    @booking.status = "pending"
    if @booking.save!
      redirect_to dashboard_path
    else
      render :new
    end
  end

  private

  def create_params
    params.require(:booking).permit(:type_of_party, :start_time, :end_time)
  end
end
