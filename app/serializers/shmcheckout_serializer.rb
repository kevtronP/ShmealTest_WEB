class ShmcheckoutSerializer < ActiveModel::Serializer
  attributes :id, :nonce, :amount
end
