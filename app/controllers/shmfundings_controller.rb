class ShmfundingsController < ApplicationController
  before_action :set_shmfunding, only: [:show, :update, :destroy]

  # GET /shmfundings
  def index
    @shmfundings = Shmfunding.all

    render json: @shmfundings
  end

  # GET /shmfundings/1
  def show
    render json: @shmfunding
  end

  # POST /shmfundings
  def create
    @shmfunding = Shmfunding.new(shmfunding_params)

    result = Braintree::MerchantAccount.update(
              @shmfunding.merchantID,
              :funding => {
              :destination => Braintree::MerchantAccount::FundingDestination::Bank,
              :account_number => "1123581321",
              :routing_number => "071101399"
            })

    if result.success?
      p "Merchant account successfully updated"
    else
      p result.errors
    end

    if @shmfunding.save
      render json: @shmfunding, status: :created, location: @shmfunding
    else
      render json: @shmfunding.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shmfundings/1
  def update
    if @shmfunding.update(shmfunding_params)
      render json: @shmfunding
    else
      render json: @shmfunding.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shmfundings/1
  def destroy
    @shmfunding.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shmfunding
      @shmfunding = Shmfunding.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def shmfunding_params
      params.require(:shmfunding).permit(:userID, :merchantID, :fundingType, :email, :phoneNumber, :accountNumber, :routingNumber, :fundingDate)
    end
end
