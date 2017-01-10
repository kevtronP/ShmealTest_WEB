class ShmcheckoutsController < ApplicationController
  before_action :set_shmcheckout, only: [:show, :update, :destroy]

  # GET /shmcheckouts
  def index
    @shmcheckouts = Shmcheckout.all

    render json: @shmcheckouts
  end

  # GET /shmcheckouts/1
  def show
    render json: @shmcheckout
  end

  # POST /shmcheckouts
  def create
    @shmcheckout = Shmcheckout.new(shmcheckout_params)

    result = Braintree::Transaction.sale(
            :amount => @shmcheckout.amount,
            :payment_method_nonce => @shmcheckout.nonce,
            :merchant_account_id => @shmcheckout.merchantID,
            :options => {
              :submit_for_settlement => true
            }

            )
            if result.success?

            else
              p result.errors
            end

    if @shmcheckout.save
      render json: @shmcheckout, status: :created, location: @shmcheckout
    else
      render json: @shmcheckout.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shmcheckouts/1
  def update
    if @shmcheckout.update(shmcheckout_params)
      render json: @shmcheckout
    else
      render json: @shmcheckout.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shmcheckouts/1
  def destroy
    @shmcheckout.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shmcheckout
      @shmcheckout = Shmcheckout.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def shmcheckout_params
      params.require(:shmcheckout).permit(:nonce, :amount, :merchantID)
    end
end
