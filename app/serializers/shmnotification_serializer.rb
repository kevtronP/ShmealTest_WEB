class ShmnotificationSerializer < ActiveModel::Serializer
  attributes :id, :notificationDate, :notificationMessage, :menuItem, :otherUser, :user
end
