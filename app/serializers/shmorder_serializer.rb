class ShmorderSerializer < ActiveModel::Serializer
  attributes :id, :orderActualTime, :orderApproved, :orderDay, :orderPickupTime, :orderPickedUp, :orderPrice, :orderQuantity, :orderScore, :orderReviewIgnored, :orderTime, :conversationID, :shmealID, :eaterID, :cookID
end
