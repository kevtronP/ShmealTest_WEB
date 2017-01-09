class ShmaddressesController < ApplicationController
  before_action :set_shmaddress, only: [:show, :update, :destroy]

  # GET /shmaddresses
  def index
    @shmaddresses = Shmaddress.all

    render json: @shmaddresses
  end

  # GET /shmaddresses/1
  def show
    render json: @shmaddress
  end

  # POST /shmaddresses
  def create
    @shmaddress = Shmaddress.new(shmaddress_params)

    if @shmaddress.save
      render json: @shmaddress, status: :created, location: @shmaddress
    else
      render json: @shmaddress.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shmaddresses/1
  def update
    if @shmaddress.update(shmaddress_params)
      render json: @shmaddress
    else
      render json: @shmaddress.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shmaddresses/1
  def destroy
    @shmaddress.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shmaddress
      @shmaddress = Shmaddress.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def shmaddress_params
      params.require(:shmaddress).permit(:firstName, :lastName, :streetAddress, :streetAddress2, :locality, :postalCode, :region, :addressDate, :userID)
    end
end
