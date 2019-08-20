class PagesController < ApplicationController
  def home
  end

  def dashboard
    bookings = Booking.all
    @my_locations = current_user.locations
    @my_bookings = []
    @received_bookings = []
    bookings.each do |booking|
      @my_bookings << booking if booking.user == current_user
      current_user.locations.each do |location|
        @received_bookings << booking if location == booking.location
      end
    end
  end
end
