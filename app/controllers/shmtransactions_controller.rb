class ShmtransactionsController < ApplicationController
  before_action :set_shmtransaction, only: [:show, :update, :destroy]

  # GET /shmtransactions
  def index
    @shmtransactions = Shmtransaction.all

    render json: @shmtransactions
  end

  # GET /shmtransactions/1
  def show
    render json: @shmtransaction
  end

  # POST /shmtransactions
  def create
    @shmtransaction = Shmtransaction.new(shmtransaction_params)

    @shmtransaction.client_token = Braintree::ClientToken.generate

    if @shmtransaction.save
      render json: @shmtransaction, status: :created, location: @shmtransaction
    else
      render json: @shmtransaction.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shmtransactions/1
  def update
    if @shmtransaction.update(shmtransaction_params)
      render json: @shmtransaction
    else
      render json: @shmtransaction.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shmtransactions/1
  def destroy
    @shmtransaction.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shmtransaction
      @shmtransaction = Shmtransaction.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def shmtransaction_params
      params.require(:shmtransaction).permit(:payment_token, :client_token, :paymentType)
    end
end
