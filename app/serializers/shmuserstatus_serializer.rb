class ShmuserstatusSerializer < ActiveModel::Serializer
  attributes :id, :statusCode, :sendingUserID, :receivingUserID, :statusStartDate
end
