class MerchantwebhooksController < ApplicationController
  before_action :set_merchantwebhook, only: [:show, :update, :destroy]

  # GET /merchantwebhooks
  def index
    @merchantwebhooks = Merchantwebhook.all

    render json: @merchantwebhooks
  end

  # GET /merchantwebhooks/1
  def show
    render json: @merchantwebhook
  end

  # POST /merchantwebhooks

  def create
    @merchantwebhook = Merchantwebhook.new(merchantwebhook_params)

    sample_notification = Braintree::WebhookTesting.sample_notification(
      Braintree::WebhookNotification::Kind::SubscriptionWentPastDue,
      "my_id"
    )

    webhook_notification = Braintree::WebhookNotification.parse(
      sample_notification[:bt_signature],
      sample_notification[:bt_payload]
    )

    @merchantwebhook.kind = webhook_notification.kind
    @merchantwebhook.notificationTime = webhook_notification.timestamp
    @merchantwebhook.message = webhook_notification.message
    @merchantwebhook.errorMessages = webhook_notification.errors
    @merchantwebhook.merchantID = webhook_notification.merchant_account_id

    if @merchantwebhook.save
      render json: @merchantwebhook, status: :created, location: @merchantwebhook
    else
      render json: @merchantwebhook.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /merchantwebhooks/1
  def update
    if @merchantwebhook.update(merchantwebhook_params)
      render json: @merchantwebhook
    else
      render json: @merchantwebhook.errors, status: :unprocessable_entity
    end
  end

  # DELETE /merchantwebhooks/1
  def destroy
    @merchantwebhook.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_merchantwebhook
      @merchantwebhook = Merchantwebhook.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def merchantwebhook_params
      params.require(:merchantwebhook).permit(:kind, :merchantID, :message, :errorMessages, :notificationTime)
    end
end
