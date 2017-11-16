class ShmpaymentmethodstatusesController < ApplicationController
  before_action :set_shmpaymentmethodstatus, only: [:show, :update, :destroy]

  # GET /shmpaymentmethodstatuses
  def index
    @shmpaymentmethodstatuses = Shmpaymentmethodstatus.all

    render json: @shmpaymentmethodstatuses
  end

  # GET /shmpaymentmethodstatuses/1
  def show
    render json: @shmpaymentmethodstatus
  end

  # POST /shmpaymentmethodstatuses
  def create
    @shmpaymentmethodstatus = Shmpaymentmethodstatus.new(shmpaymentmethodstatus_params)

    if @shmpaymentmethodstatus.save
      render json: @shmpaymentmethodstatus, status: :created, location: @shmpaymentmethodstatus
    else
      render json: @shmpaymentmethodstatus.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shmpaymentmethodstatuses/1
  def update
    if @shmpaymentmethodstatus.update(shmpaymentmethodstatus_params)
      render json: @shmpaymentmethodstatus
    else
      render json: @shmpaymentmethodstatus.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shmpaymentmethodstatuses/1
  def destroy
    @shmpaymentmethodstatus.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shmpaymentmethodstatus
      @shmpaymentmethodstatus = Shmpaymentmethodstatus.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def shmpaymentmethodstatus_params
      params.require(:shmpaymentmethodstatus).permit(:statusCode, :paymentMethodID, :statusStartDate)
    end
end
