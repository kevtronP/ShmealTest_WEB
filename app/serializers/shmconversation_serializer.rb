class ShmconversationSerializer < ActiveModel::Serializer
  attributes :id, :convChannel, :originalCookID, :originalEaterID, :convStartDate, :origCookCheckInDate, :origEaterCheckInDate, :lastMessageDate
end
