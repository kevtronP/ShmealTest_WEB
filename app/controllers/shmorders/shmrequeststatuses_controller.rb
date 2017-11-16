class ShmrequeststatusesController < ApplicationController
  before_action :set_shmrequeststatus, only: [:show, :update, :destroy]

  # GET /shmrequeststatuses
  def index
    @shmrequeststatuses = Shmrequeststatus.all

    render json: @shmrequeststatuses
  end

  # GET /shmrequeststatuses/1
  def show
    render json: @shmrequeststatus
  end

  # POST /shmrequeststatuses
  def create
    @shmrequeststatus = Shmrequeststatus.new(shmrequeststatus_params)

    if @shmrequeststatus.save
      render json: @shmrequeststatus, status: :created, location: @shmrequeststatus
    else
      render json: @shmrequeststatus.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shmrequeststatuses/1
  def update
    if @shmrequeststatus.update(shmrequeststatus_params)
      render json: @shmrequeststatus
    else
      render json: @shmrequeststatus.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shmrequeststatuses/1
  def destroy
    @shmrequeststatus.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shmrequeststatus
      @shmrequeststatus = Shmrequeststatus.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def shmrequeststatus_params
      params.require(:shmrequeststatus).permit(:statusCode, :requestID, :statusStartDate)
    end
end
