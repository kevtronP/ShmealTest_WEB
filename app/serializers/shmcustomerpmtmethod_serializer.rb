class ShmcustomerpmtmethodSerializer < ActiveModel::Serializer
  attributes :id, :customerIDString, :firstName, :lastName, :paymentMethodToken, :paymentType, :cardLastFour, :venmoName, :nonce, :userID
end
