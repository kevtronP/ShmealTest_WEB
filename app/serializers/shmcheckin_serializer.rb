class ShmcheckinSerializer < ActiveModel::Serializer
  attributes :id, :checkInTime, :messageSent, :userID, :conversationID
end
