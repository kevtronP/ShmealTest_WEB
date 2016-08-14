class ShmnotificationsController < ApplicationController
  before_action :set_shmnotification, only: [:show, :update, :destroy]

  # GET /shmnotifications
  def index
    @shmnotifications = Shmnotification.all

    render json: @shmnotifications
  end

  # GET /shmnotifications/1
  def show
    render json: @shmnotification
  end

  # POST /shmnotifications
  def create
    @shmnotification = Shmnotification.new(shmnotification_params)

    if @shmnotification.save
      render json: @shmnotification, status: :created, location: @shmnotification
    else
      render json: @shmnotification.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shmnotifications/1
  def update
    if @shmnotification.update(shmnotification_params)
      render json: @shmnotification
    else
      render json: @shmnotification.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shmnotifications/1
  def destroy
    @shmnotification.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shmnotification
      @shmnotification = Shmnotification.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def shmnotification_params
      params.require(:shmnotification).permit(:userID, :otherUserID, :menuItemID, :notificationMessage, :notificationDate, :unfollowTimeStamp)
    end
end
