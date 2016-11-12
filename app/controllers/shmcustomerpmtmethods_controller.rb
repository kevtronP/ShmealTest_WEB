class ShmcustomerpmtmethodsController < ApplicationController
  before_action :set_shmcustomerpmtmethod, only: [:show, :update, :destroy]

  # GET /shmcustomerpmtmethods
  def index
    @shmcustomerpmtmethods = Shmcustomerpmtmethod.all

    render json: @shmcustomerpmtmethods
  end

  # GET /shmcustomerpmtmethods/1
  def show
    render json: @shmcustomerpmtmethod
  end

  # POST /shmcustomerpmtmethods
  def create
    @shmcustomerpmtmethod = Shmcustomerpmtmethod.new(shmcustomerpmtmethod_params)

    result = Braintree::Customer.create(
      :first_name => @shmcustomerpmtmethod.firstName,
      :last_name => @shmcustomerpmtmethod.lastName,
      :payment_method_nonce => @shmcustomerpmtmethod.nonce
      )
      if result.success?
        @shmcustomerpmtmethod.customerIDString = result.customer.id
        @shmcustomerpmtmethod.paymentMethodToken = result.customer.payment_methods[0].token
      else
        p result.errors
      end

    if @shmcustomerpmtmethod.save
      render json: @shmcustomerpmtmethod, status: :created, location: @shmcustomerpmtmethod
    else
      render json: @shmcustomerpmtmethod.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shmcustomerpmtmethods/1
  def update
    if @shmcustomerpmtmethod.update(shmcustomerpmtmethod_params)
      render json: @shmcustomerpmtmethod
    else
      render json: @shmcustomerpmtmethod.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shmcustomerpmtmethods/1
  def destroy
    @shmcustomerpmtmethod.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shmcustomerpmtmethod
      @shmcustomerpmtmethod = Shmcustomerpmtmethod.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def shmcustomerpmtmethod_params
      params.require(:shmcustomerpmtmethod).permit(:customerIDString, :firstName, :lastName, :paymentMethodToken, :nonce, :userID)
    end
end
