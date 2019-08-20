class PagesController < ApplicationController
  def home
  end

  def dashboard
    @my_bookings = current_user.bookings
    @my_locations = current_user.locations
    bookings = Booking.all
    @pending = []
    bookings.each do |booking|
      @pending << booking if booking.user == current_user
    end
  end
end
