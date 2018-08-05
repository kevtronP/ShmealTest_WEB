class ShmcookstatusSerializer < ActiveModel::Serializer
  attributes :id, :statusCode, :cookID, :statusStartDate
end
