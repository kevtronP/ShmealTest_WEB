class ShmchatchannelSerializer < ActiveModel::Serializer
  attributes :id, :chatChannel, :chatCheckIn1, :chatCheckIn2, :chatUser1, :chatUser2
end
