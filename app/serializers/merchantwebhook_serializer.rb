class MerchantwebhookSerializer < ActiveModel::Serializer
  attributes :id, :kind, :merchantID, :message, :errors, :notificationTime
end
