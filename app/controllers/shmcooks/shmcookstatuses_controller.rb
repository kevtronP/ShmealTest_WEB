class Shmcooks::ShmcookstatusesController < ApplicationController
  before_action :set_shmcookstatus, only: [:show, :update, :destroy]

  # GET /shmcookstatuses
  def index
    @shmcookstatuses = Shmcookstatus.all

    render json: @shmcookstatuses
  end

  # GET /shmcookstatuses/1
  def show
    render json: @shmcookstatus
  end

  # POST /shmcookstatuses
  def create
    @shmcookstatus = Shmcookstatus.new(shmcookstatus_params)

    if @shmcookstatus.save
      render json: @shmcookstatus, status: :created, location: @shmcookstatus
    else
      render json: @shmcookstatus.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shmcookstatuses/1
  def update
    if @shmcookstatus.update(shmcookstatus_params)
      render json: @shmcookstatus
    else
      render json: @shmcookstatus.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shmcookstatuses/1
  def destroy
    @shmcookstatus.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shmcookstatus
      @shmcookstatus = Shmcookstatus.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def shmcookstatus_params
      params.require(:shmcookstatus).permit(:statusCode, :cookID, :statusStartDate)
    end
end
