class MerchantwebhookSerializer < ActiveModel::Serializer
  attributes :id, :kind, :merchantID, :message, :errorMessages, :bt_signature, :bt_payload, :notificationTime
end
