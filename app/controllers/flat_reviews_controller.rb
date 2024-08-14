class FlatReviewsController < ApplicationController
  before_action :set_flat_review, only: [:edit, :update]
  def new
    @booking_id = Booking.find(params[:booking_id])
    @flat_review = FlatReview.new
  end

  def create
    @flat_review = FlatReview.new(flat_review_params)
    @booking_id = Booking.find(params[:booking_id])
    @flat_review.booking_id = @booking_id.id

    if @flat_review.save!
      redirect_to booking_path(@booking_id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @flat_review.update(flat_review_params)
    @flat_review.save!
    redirect_to booking_path(@flat_review)
  end

  private

  def set_flat_review
    @flat_review = FlatReview.find(params[:id])
  end

  def flat_review_params
    params.require(:flat_review).permit(:comment, :rating)
  end
end
