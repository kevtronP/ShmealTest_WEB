class MerchantwebhookSerializer < ActiveModel::Serializer
  attributes :id, :kind, :merchantID, :message, :errorMessages, :notificationTime
end
