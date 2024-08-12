class FlatReviewsController < ApplicationController
  before_action :set_flat_review, only: [:edit, :update]
  def new
    @flat_review = FlatReview.new
  end

  def create
    @flat_review = FlatReview.new(flat_review_params)
    @booking = Booking.find(params[:booking_id])
    @flat = Flat.find(params[:flat_id])
    # @flat_review.flat = @flat
    # @flat_review.booking = @booking

    if @flat_review.save!
      redirect_to flat_booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @flat_review.update(flat_review_params)
    @flat_review.save!
    redirect_to flat_booking_path(@flat)
  end

  private

  def set_flat_review
    @flat_review = FlatReview.find(params[:id])
  end

  def flat_review_params
    params.require(:flat_review).permit(:comment, :rating)
  end
end
