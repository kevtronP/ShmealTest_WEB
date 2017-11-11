class Shmeals::ShmshmealstatusesController < ApplicationController
  before_action :set_shmshmealstatus, only: [:show, :update, :destroy]

  # GET /shmshmealstatuses
  def index
    #@shmshmealstatuses = Shmshmealstatus.all
    #params[:shmealID] = params[:shmeal_id]
    @shmeal = Shmeal.find(shmeal_params[:shmeal_id])
    @shmshmealstatuses = @shmeal.shmshmealstatuses

    render json: @shmshmealstatuses
  end

  # GET /shmshmealstatuses/1
  def show
    render json: @shmshmealstatus
  end

  # POST /shmshmealstatuses
  def create
    @shmshmealstatus = Shmshmealstatus.new(shmshmealstatus_params)

    if @shmshmealstatus.save
      render json: @shmshmealstatus, status: :created, location: @shmshmealstatus
    else
      render json: @shmshmealstatus.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shmshmealstatuses/1
  def update
    if @shmshmealstatus.update(shmshmealstatus_params)
      render json: @shmshmealstatus
    else
      render json: @shmshmealstatus.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shmshmealstatuses/1
  def destroy
    @shmshmealstatus.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shmshmealstatus
      @shmshmealstatus = Shmshmealstatus.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def shmshmealstatus_params
      params.require(:shmshmealstatus).permit(:shmeal_id, :statusCode, :shmealID, :statusStartDate)
    end
end
