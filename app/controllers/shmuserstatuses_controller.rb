class ShmuserstatusesController < ApplicationController
  before_action :set_shmuserstatus, only: [:show, :update, :destroy]

  # GET /shmuserstatuses
  def index
    @shmuserstatuses = Shmuserstatus.all

    render json: @shmuserstatuses
  end

  # GET /shmuserstatuses/1
  def show
    render json: @shmuserstatus
  end

  # POST /shmuserstatuses
  def create
    @shmuserstatus = Shmuserstatus.new(shmuserstatus_params)

    @shmuserstatus.user_id = @shmuserstatus.sendingUserID
    #@shmuserstatus.shmcook_id = @shmuserstatus.receivingUserID

    @shmcook = Shmcook.where(:userID => @shmuserstatus.receivingUserID).first
    @shmuserstatus.shmcook_id = @shmcook.id

    if @shmuserstatus.save
      render json: @shmuserstatus, status: :created, location: @shmuserstatus
    else
      render json: @shmuserstatus.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shmuserstatuses/1
  def update
    if @shmuserstatus.update(shmuserstatus_params)
      render json: @shmuserstatus
    else
      render json: @shmuserstatus.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shmuserstatuses/1
  def destroy
    @shmuserstatus.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shmuserstatus
      @shmuserstatus = Shmuserstatus.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def shmuserstatus_params
      params.require(:shmuserstatus).permit(:statusCode, :sendingUserID, :receivingUserID, :statusStartDate)
    end
end
