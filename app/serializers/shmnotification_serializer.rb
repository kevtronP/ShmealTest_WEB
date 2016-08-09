class ShmnotificationSerializer < ActiveModel::Serializer
  attributes :id, :userID, :otherUserID, :menuItemID, :notificationMessage, :notificationDate
end
