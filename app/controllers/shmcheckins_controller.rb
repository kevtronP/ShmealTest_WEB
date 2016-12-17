class ShmcheckinsController < ApplicationController
  before_action :set_shmcheckin, only: [:show, :update, :destroy]

  # GET /shmcheckins
  def index
    @shmcheckins = Shmcheckin.all

    render json: @shmcheckins
  end

  # GET /shmcheckins/1
  def show
    render json: @shmcheckin
  end

  # POST /shmcheckins
  def create
    @shmcheckin = Shmcheckin.new(shmcheckin_params)

    if @shmcheckin.save
      render json: @shmcheckin, status: :created, location: @shmcheckin
    else
      render json: @shmcheckin.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shmcheckins/1
  def update
    if @shmcheckin.update(shmcheckin_params)
      render json: @shmcheckin
    else
      render json: @shmcheckin.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shmcheckins/1
  def destroy
    @shmcheckin.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shmcheckin
      @shmcheckin = Shmcheckin.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def shmcheckin_params
      params.require(:shmcheckin).permit(:checkInTime, :messageSent, :userID, :conversationID)
    end
end
