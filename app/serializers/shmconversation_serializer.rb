class ShmconversationSerializer < ActiveModel::Serializer
  attributes :id, :convChannel, :convCheckIn1, :convCheckIn2, :convLastDate, :convLastMessage, :convUser1, :convUser2, :originalCookID, :originalEaterID
end
