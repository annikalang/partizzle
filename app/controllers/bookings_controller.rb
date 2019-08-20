class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end


  def create
    @booking = Booking.new
    @booking.location = Location.find(params[:location_id])
    @booking.start_time = Date.parse(create_params[:start_time])
    @booking.end_time = Date.parse(create_params[:end_time])
    @booking.type_of_party = create_params[:type_of_party]
    @booking.user = current_user
    @booking.status = "pending"
    @booking.save!
    redirect_to location_path(@booking.location)
  end

  private

  def create_params
    params.require(:booking).permit(:type_of_party, :start_time, :end_time)
  end
end
