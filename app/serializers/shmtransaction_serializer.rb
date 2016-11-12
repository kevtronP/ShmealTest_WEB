class ShmtransactionSerializer < ActiveModel::Serializer
  attributes :id, :payment_token, :client_token, :paymentType
end
