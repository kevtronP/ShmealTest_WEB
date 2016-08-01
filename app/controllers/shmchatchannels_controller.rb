class ShmchatchannelsController < ApplicationController
  before_action :set_shmchatchannel, only: [:show, :update, :destroy]

  # GET /shmchatchannels
  def index
    @shmchatchannels = Shmchatchannel.all

    render json: @shmchatchannels
  end

  # GET /shmchatchannels/1
  def show
    render json: @shmchatchannel
  end

  # POST /shmchatchannels
  def create
    @shmchatchannel = Shmchatchannel.new(shmchatchannel_params)

    if @shmchatchannel.save
      render json: @shmchatchannel, status: :created, location: @shmchatchannel
    else
      render json: @shmchatchannel.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shmchatchannels/1
  def update
    if @shmchatchannel.update(shmchatchannel_params)
      render json: @shmchatchannel
    else
      render json: @shmchatchannel.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shmchatchannels/1
  def destroy
    @shmchatchannel.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shmchatchannel
      @shmchatchannel = Shmchatchannel.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def shmchatchannel_params
      params.require(:shmchatchannel).permit(:chatChannel, :chatCheckIn1, :chatCheckIn2, :chatUser1, :chatUser2)
    end
end
