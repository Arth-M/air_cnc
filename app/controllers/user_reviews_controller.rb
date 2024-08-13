class UserReviewsController < ApplicationController
  before_action :set_user_review, only: [:edit, :update]
  def new
    @user_id = User.find(params[:user_id])
    @user_review = UserReview.new
  end

  def create
    @user_review = UserReview.new(user_review_params)

    if @user_review.save!
      redirect_to _path()
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @user_review.update(user_review_params)
    @user_review.save!
    redirect_to user_booking_path(@user)
  end

  private

  def set_user_review
    @user_review = UserReview.find(params[:id])
  end

  def user_review_params
    params.require(:user_review).permit(:comment, :rating)
  end
end
