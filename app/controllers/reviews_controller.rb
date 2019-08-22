class ReviewsController < ApplicationController
  def new
    @review = Review.new(params[:id])
    @location = Location.find(params[:location_id])
    @booking = Booking.find(params[:booking_id])
  end

  def create
    @review = Review.new(reviews_params)
    @booking = Booking.find(params[:booking_id])
    @review.booking = @booking

    if @review.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def reviews_params
    params.require(:review).permit(:content, :rating)
  end
end
