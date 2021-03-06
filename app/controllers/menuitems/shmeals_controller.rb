class Menuitems::ShmealsController < ApplicationController
  before_action :set_shmeal, only: [:show, :update, :destroy]

  # GET /shmeals
  def index

    @menuitem = Menuitem.find(params[:menuitem_id])
    @shmeals = @menuitem.shmeals

    render json: @shmeals
  end

  # GET /shmeals/1
  def show
    @shmeal = Shmeal.find(params[:id])
    @shmshmealstatuses = @shmeal.shmshmealstatuses
    render json: @shmeal
  end

  # POST /shmeals
  def create
    @shmeal = Shmeal.new(shmeal_params)

    if @shmeal.save
      render json: @shmeal, status: :created, location: @shmeal
    else
      render json: @shmeal.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shmeals/1
  def update
    if @shmeal.update(shmeal_params)
      render json: @shmeal
    else
      render json: @shmeal.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shmeals/1
  def destroy
    @shmeal.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shmeal
      @shmeal = Shmeal.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def shmeal_params
      params.require(:shmeal).permit(:shmealDayDate, :menuItemID)
    end
end
