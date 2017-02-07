class ShmorderSerializer < ActiveModel::Serializer
  attributes :id, :orderDay, :orderTime, :conversationID, :shmealID, :eaterID, :cookID
end
