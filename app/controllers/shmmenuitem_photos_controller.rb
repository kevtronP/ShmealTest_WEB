class ShmmenuitemPhotosController < ApplicationController
  before_action :set_shmmenuitem_photo, only: [:show, :update, :destroy]

  # GET /shmmenuitem_photos
  def index
    @shmmenuitem_photos = ShmmenuitemPhoto.all

    render json: @shmmenuitem_photos
  end

  # GET /shmmenuitem_photos/1
  def show
    render json: @shmmenuitem_photo
  end

  # POST /shmmenuitem_photos
  def create
    @shmmenuitem_photo = ShmmenuitemPhoto.new(shmmenuitem_photo_params)

    if @shmmenuitem_photo.save
      render json: @shmmenuitem_photo, status: :created, location: @shmmenuitem_photo
    else
      render json: @shmmenuitem_photo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shmmenuitem_photos/1
  def update
    if @shmmenuitem_photo.update(shmmenuitem_photo_params)
      render json: @shmmenuitem_photo
    else
      render json: @shmmenuitem_photo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shmmenuitem_photos/1
  def destroy
    @shmmenuitem_photo.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shmmenuitem_photo
      @shmmenuitem_photo = ShmmenuitemPhoto.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def shmmenuitem_photo_params
      params.require(:shmmenuitem_photo).permit(:data, :menuItem)
    end
end
