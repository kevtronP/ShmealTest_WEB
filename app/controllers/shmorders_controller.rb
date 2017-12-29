class ShmordersController < ApplicationController
  before_action :set_shmorder, only: [:show, :update, :destroy]

  # GET /shmorders
  def index
    @shmorders = Shmorder.all

    render json: @shmorders
  end

  # GET /shmorders/1
  def show
    @shmorder = Shmorder.find(params[:id])
    @shmorderfeedbacks = @shmorder.shmorderfeedbacks
    @shmrequestattributes = @shmorder.shmrequestattributes
    @shmrequeststatuses = @shmorder.shmrequeststatuses
    render json: @shmorder
  end

  # POST /shmorders
  def create
    @shmorder = Shmorder.new(shmorder_params)

    @shmorder.shmeal_id = @shmorder.shmealID
    @shmorder.shmconversation_id = @shmorder.conversationID
    @shmorder.user_id = @shmorder.eaterID

    #find cook since this cookID reflects cook's userID
    @shmcook = Shmcook.find(1, :userID => @shmorder.cookID)
    @shmorder.shmcook_id = @shmcook.id

    if @shmorder.save
      render json: @shmorder, status: :created, location: @shmorder
    else
      render json: @shmorder.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shmorders/1
  def update
    if @shmorder.update(shmorder_params)
      render json: @shmorder
    else
      render json: @shmorder.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shmorders/1
  def destroy
    @shmorder.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shmorder
      @shmorder = Shmorder.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def shmorder_params
      params.require(:shmorder).permit(:orderDay, :orderTime, :conversationID, :shmealID, :eaterID, :cookID)
    end
end
