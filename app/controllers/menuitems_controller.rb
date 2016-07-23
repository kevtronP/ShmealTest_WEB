class MenuitemsController < ApplicationController
  before_action :set_menuitem, only: [:show, :update, :destroy]

  # GET /menuitems
  def index
    @menuitems = Menuitem.all

    render json: @menuitems
  end

  # GET /menuitems/1
  def show
    render json: @menuitem
  end

  # POST /menuitems
  def create
    @menuitem = Menuitem.new(menuitem_params)

    if @menuitem.save
      render json: @menuitem, status: :created, location: @menuitem
    else
      render json: @menuitem.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /menuitems/1
  def update
    if @menuitem.update(menuitem_params)
      render json: @menuitem
    else
      render json: @menuitem.errors, status: :unprocessable_entity
    end
  end

  # DELETE /menuitems/1
  def destroy
    @menuitem.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menuitem
      @menuitem = Menuitem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def menuitem_params
      params.require(:menuitem).permit(:mealAllergen1, :mealBlurb, :mealLastDate, :mealName, :mealQuantity, :mealScore, :mealThumbnail, :mealTotalQuantity, :lastShmeal, :photo, :user, :mealPhotoURL)
    end
end
