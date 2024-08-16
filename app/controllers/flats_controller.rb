class FlatsController < ApplicationController
  before_action :set_flat, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @orderby = 'id'
    @order = 'ASC'

    if params['query'].present?
      @flats = Flat.search(params['query']).order("#{@orderby} #{@order}")
    else
      @flats = Flat.all.order("#{@orderby} #{@order}")
    end
    @markers = @flats.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude,
        marker_html: render_to_string(partial: "marker")
      }
    end
  end

  def show
    # if @flat.photos.attached?
    #   @photos = @flat.photo.key
    # end

    @reviews = FlatReview.where(flat_id: @flat.id)
    @mean_rating = @flat.flat_reviews.average(:rating).to_f.round(1)
  end

  def new
    @flat = Flat.new
  end

  def edit
    @flat=Flat.find(params[:id])
  end

  def create
    @flat = Flat.new(params_flat)
    @flat.user_id = current_user.id
    @flat.full_address = "#{@flat.street}, #{@flat.zipcode} #{@flat.city}"
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
    params.require(:flat).permit(:name, :city, :zipcode, :street, :full_address, :description , :price, :mean_rating, photos: [])
  end
end
