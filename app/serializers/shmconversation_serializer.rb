class ShmconversationSerializer < ActiveModel::Serializer
  attributes :id, :convChannel, :convChannel2, :convCheckIn1, :convCheckIn2, :convLastDate, :convLastMessage, :convUser1, :convUser2
end
