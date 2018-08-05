class ShmpaymentnonceSerializer < ActiveModel::Serializer
  attributes :id, :paymentMethodToken, :paymentNonce
end
