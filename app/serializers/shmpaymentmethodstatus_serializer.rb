class ShmpaymentmethodstatusSerializer < ActiveModel::Serializer
  attributes :id, :statusCode, :paymentMethodID, :statusStartDate
end
