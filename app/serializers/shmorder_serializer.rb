class ShmorderSerializer < ActiveModel::Serializer
  attributes :id, :orderActualTime, :orderApproved, :orderDay, :orderPickedUp, :orderPrice, :orderQuantity, :orderScore, :orderTime, :conversation, :shmeal, :eater, :cook
end
