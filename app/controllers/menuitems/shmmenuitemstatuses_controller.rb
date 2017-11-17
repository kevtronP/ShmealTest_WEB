class Menuitems::ShmmenuitemstatusesController < ApplicationController
  before_action :set_shmmenuitemstatus, only: [:show, :update, :destroy]

  # GET /shmmenuitemstatuses
  def index
    @shmmenuitemstatuses = Shmmenuitemstatus.all

    render json: @shmmenuitemstatuses
  end

  # GET /shmmenuitemstatuses/1
  def show
    render json: @shmmenuitemstatus
  end

  # POST /shmmenuitemstatuses
  def create
    @shmmenuitemstatus = Shmmenuitemstatus.new(shmmenuitemstatus_params)

    if @shmmenuitemstatus.save
      render json: @shmmenuitemstatus, status: :created, location: @shmmenuitemstatus
    else
      render json: @shmmenuitemstatus.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shmmenuitemstatuses/1
  def update
    if @shmmenuitemstatus.update(shmmenuitemstatus_params)
      render json: @shmmenuitemstatus
    else
      render json: @shmmenuitemstatus.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shmmenuitemstatuses/1
  def destroy
    @shmmenuitemstatus.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shmmenuitemstatus
      @shmmenuitemstatus = Shmmenuitemstatus.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def shmmenuitemstatus_params
      params.require(:shmmenuitemstatus).permit(:statusCode, :menuItemID, :statusStartDate)
    end
end
