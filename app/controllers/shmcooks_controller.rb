class ShmcooksController < ApplicationController
  before_action :set_shmcook, only: [:show, :update, :destroy]

  # GET /shmcooks
  def index
    @shmcooks = Shmcook.all

    render json: @shmcooks
  end

  def validshmcooks
    validshmcooks = shmcookstatuses.where(statusCode: "A")

    render json: validshmcooks, serializer: ShmcookAltSerializer
  end

  # GET /shmcooks/1
  def show
    @shmcook = Shmcook.find(params[:id])
    @shmconversations = @shmcook.shmconversations
    @shmcookstatuses = @shmcook.shmcookstatuses
    @shmorders = @shmcook.shmorders
    @shmuserstatuses = @shmcook.shmuserstatuses
    render json: @shmcook, serializer: ShmcookAltSerializer
  end

  # POST /shmcooks
  def create
    @shmcook = Shmcook.new(shmcook_params)

    if @shmcook.fundingType == "Venmo_email"

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
          :destination => Braintree::MerchantAccount::FundingDestination::Email,
          :email => @shmcook.email,
        },
        :tos_accepted => true,
        :master_merchant_account_id => "shmealllc",
        :id => @shmcook.merchantID
        )

        if result.success?

        else
          p result.errors
        end

    end

    if @shmcook.fundingType == "Venmo_phone"

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
          :destination => Braintree::MerchantAccount::FundingDestination::MobilePhone,
          :mobile_phone => @shmcook.phoneNumber,
        },
        :tos_accepted => true,
        :master_merchant_account_id => "Shmeal_marketplace",
        :id => @shmcook.merchantID
        )

        if result.success?

        else
          p result.errors
        end

    end

    if @shmcook.fundingType == "Bank"

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
          :account_number => @shmcook.accountNumber,
          :routing_number => @shmcook.routingNumber
        },
        :tos_accepted => true,
        :master_merchant_account_id => "Shmeal_marketplace",
        :id => @shmcook.merchantID
        )

        if result.success?

        else
          p result.errors
        end

    end
    # for copying relationship id
    @shmcook.user_id = @shmcook.userID;

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
