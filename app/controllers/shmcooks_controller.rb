class ShmcooksController < ApplicationController
  before_action :set_shmcook, only: [:show, :update, :destroy]

  # GET /shmcooks
  def index
    @shmcooks = Shmcook.all

    render json: @shmcooks
  end

  # GET /shmcooks/1
  def show
    render json: @shmcook
  end

  # POST /shmcooks
  def create
    @shmcook = Shmcook.new(shmcook_params)

    result = Braintree::MerchantAccount.create(
      :individual => {
        :first_name => @shmcook.firstName,
        :last_name => @shmcook.surName,
        :email => @shmcook.email,
        :phone => @shmcook.phoneNumber,
        :date_of_birth => @shmcook.birthDateString,
        :ssn => @shmcook.taxpayerID,
        :address => {
          :street_address => @shmcook.streetAddress,
          :locality => @shmcook.locality,
          :region => @shmcook.region,
          :postal_code => @shmcook.postalCode
        }
      },
      :funding => {
        :destination => Braintree::MerchantAccount::FundingDestination::Bank,
        :email => "funding@blueladders.com",
        :mobile_phone => "5555555555",
        :account_number => "1123581321",
        :routing_number => "071101307"
      },
      :tos_accepted => true,
      :master_merchant_account_id => "shmealllc",
      :id => @shmcook.merchantID
      )

      if result.success?

      else
        p result.errors
      end



    if @shmcook.save
      render json: @shmcook, status: :created, location: @shmcook
    else
      render json: @shmcook.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shmcooks/1
  def update
    if @shmcook.update(shmcook_params)
      render json: @shmcook
    else
      render json: @shmcook.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shmcooks/1
  def destroy
    @shmcook.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shmcook
      @shmcook = Shmcook.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def shmcook_params
      params.require(:shmcook).permit(:merchantID, :taxpayerID, :firstName, :surName, :birthDateString, :email, :phoneNumber, :streetAddress, :locality, :region, :postalCode, :fundingType, :accountNumber, :routingNumber, :userID, :cookDate)
    end
end
