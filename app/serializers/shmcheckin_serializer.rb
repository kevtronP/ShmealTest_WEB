class ShmcheckinSerializer < ActiveModel::Serializer
  attributes :id, :checkInTime, :userID, :conversationID
end
