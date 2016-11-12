class ShmcustomerpmtmethodSerializer < ActiveModel::Serializer
  attributes :id, :customerIDString, :firstName, :lastName, :paymentMethodToken, :nonce, :userID
end
