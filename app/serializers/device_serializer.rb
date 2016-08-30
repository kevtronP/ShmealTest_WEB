class DeviceSerializer < ActiveModel::Serializer
  attributes :id, :deviceToken, :pushNotificationsOn, :deviceTokenBeginDate, :userID
end
