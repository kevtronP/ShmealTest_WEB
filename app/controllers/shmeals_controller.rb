class ShmealsController < ApplicationController
  before_action :set_shmeal, only: [:show, :update, :destroy]

  # GET /shmeals
  def index
    @shmeals = Shmeal.all

    render json: @shmeals
  end

  def future

    #Looks for upcoming shmeals between now and next month

    @shmeals = Shmeal.where({shmealDayDate: Date.today.prev_day..Date.today.next_month})

    render json: @shmeals, each_serializer: ShmealAltSerializer, include: 'menuitem,shmshmealattributes,shmshmealstatuses,menuitem.shmshmealattributes,menuitem.user,menuitem.user.shmuserattributes'

  end

  # def latlng
  #   @shmeals = Shmeal.where({shmealDayDate: Date.today.prev_day..Date.today.next_month})

  #   render json: @shmeals, each_serializer: ShmealAltSerializer, include:'menuitem.user.shmuserattributes'
  # end

  # GET /shmeals/1
  def show
    @shmeal = Shmeal.find(params[:id])
    @shmshmealstatuses = @shmeal.shmshmealstatuses
    @shmorders = @shmeal.shmorders
    @shmshmealattributes = @shmeal.shmshmealattributes
    render json: @shmeal, serializer: ShmealAltSerializer, include: 'menuitem,shmshmealattributes,shmshmealstatuses,menuitem.shmshmealattributes,menuitem.user,menuitem.user.shmuserattributes'
  end

  # POST /shmeals
  def create
    @shmeal = Shmeal.new(shmeal_params)

    @shmeal.menuitem_id = @shmeal.menuItemID

    if @shmeal.save
      render json: @shmeal, status: :created, location: @shmeal
    else
      render json: @shmeal.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shmeals/1
  def update
    if @shmeal.update(shmeal_params)
      render json: @shmeal
    else
      render json: @shmeal.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shmeals/1
  def destroy
    @shmeal.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shmeal
      @shmeal = Shmeal.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def shmeal_params
      params.require(:shmeal).permit(:shmealDayDate, :menuItemID)
    end
end
