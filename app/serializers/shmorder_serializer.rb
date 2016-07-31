class ShmorderSerializer < ActiveModel::Serializer
  attributes :id, :orderActualTime, :orderApproved, :orderDay, :orderPickedUp, :orderPrice, :orderQuantity, :orderScore, :orderTime, :conversationID, :shmealID, :eaterID, :cookID
end
