class ShmcooksController < ApplicationController
  before_action :set_shmcook, only: [:show, :update, :destroy]

  # GET /shmcooks
  def index
    @shmcooks = Shmcook.all

    render json: @shmcooks
  end

  # GET /shmcooks/1
  def show
    render json: @shmcook
  end

  # POST /shmcooks
  def create
    @shmcook = Shmcook.new(shmcook_params)

    if @shmcook.save
      render json: @shmcook, status: :created, location: @shmcook
    else
      render json: @shmcook.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shmcooks/1
  def update
    if @shmcook.update(shmcook_params)
      render json: @shmcook
    else
      render json: @shmcook.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shmcooks/1
  def destroy
    @shmcook.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shmcook
      @shmcook = Shmcook.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def shmcook_params
      params.require(:shmcook).permit(:taxpayerID, :userID)
    end
end
