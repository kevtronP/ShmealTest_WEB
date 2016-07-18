class ShmealSerializer < ActiveModel::Serializer
  attributes :id, :shmealLat, :shmealLon, :shmealPostDate, :shmealDayDate, :shmealStartTime, :shmealEndTime, :shmealQuantity, :shmealScore, :menuItem_id
end
