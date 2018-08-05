class ShmcheckoutSerializer < ActiveModel::Serializer
  attributes :id, :nonce, :amount, :feeAmount, :deviceData, :merchantID
end
