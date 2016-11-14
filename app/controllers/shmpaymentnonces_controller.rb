class ShmpaymentnoncesController < ApplicationController
  before_action :set_shmpaymentnonce, only: [:show, :update, :destroy]

  # GET /shmpaymentnonces
  def index
    @shmpaymentnonces = Shmpaymentnonce.all

    render json: @shmpaymentnonces
  end

  # GET /shmpaymentnonces/1
  def show
    render json: @shmpaymentnonce
  end

  # POST /shmpaymentnonces
  def create
    @shmpaymentnonce = Shmpaymentnonce.new(shmpaymentnonce_params)

    result = Braintree::PaymentMethodNonce.create(@shmpaymentnonce.paymentMethodToken)

    @shmpaymentnonce.PaymentMethodNonce = result.payment_method_nonce.nonce

    if @shmpaymentnonce.save
      render json: @shmpaymentnonce, status: :created, location: @shmpaymentnonce
    else
      render json: @shmpaymentnonce.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shmpaymentnonces/1
  def update
    if @shmpaymentnonce.update(shmpaymentnonce_params)
      render json: @shmpaymentnonce
    else
      render json: @shmpaymentnonce.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shmpaymentnonces/1
  def destroy
    @shmpaymentnonce.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shmpaymentnonce
      @shmpaymentnonce = Shmpaymentnonce.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def shmpaymentnonce_params
      params.require(:shmpaymentnonce).permit(:paymentMethodToken, :paymentNonce)
    end
end
