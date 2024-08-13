class FlatsController < ApplicationController
  before_action :set_flat, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @orderby = 'id'
    @order = 'ASC'
    @flats = Flat.all.order("#{@orderby} #{@order}")
  end

  def show
    # if @flat.photos.attached?
    #   @photos = @flat.photo.key
    # end
    @booking_flat = Flat.find(params[:id]).bookings
    # @booking_flat.each do |booking_review|
    #   @review = FlatReview.where(booking_id: booking_review.id)
    # end
  end

  def new
    @flat = Flat.new
  end

  def edit
  end

  def create
    @flat = Flat.new(params_flat)
    @flat.user_id = current_user.id
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def update
    @flat.update!(params_flat)
    redirect_to flat_path(@flat)
  end

  def destroy
    @flat.destroy
    redirect_to flats_path
  end

  private
  def set_flat
    @flat = Flat.find(params[:id])
  end

  def params_flat
    params.require(:flat).permit(:name, :city, :zipcode, :street, :full_address, :description , :price, :mean_rating, :photos)
  end
end
