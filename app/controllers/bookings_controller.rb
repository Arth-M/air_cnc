class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show]
  def show
    @booking=Booking.find(params[:id])
    @flat = Flat.find(@booking.flat_id)
    booked_time =  @booking.end_date.to_time-@booking.start_date.to_time
    @booked_days = booked_time/(24*60*60)
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(params_booking)
    # @user=current_user
    @flat=Flat.find(params[:flat_id])
    @booking.flat_id=@flat.id
    @booking.user_id = current_user.id
    booked_time =  @booking.end_date.to_time-@booking.start_date.to_time
    @booked_days = booked_time/(24*60*60)
    @booking.payment_amount = @booked_days * @flat.price
    if @booking.save!
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  private
  def set_booking
    @booking = Booking.find(params[:id])
  end

  def params_booking
    params.require(:booking).permit(:start_date, :end_date, :payment_amount, :flat_id, :user_id, :price, :mean_rating, :photos)
  end

end
