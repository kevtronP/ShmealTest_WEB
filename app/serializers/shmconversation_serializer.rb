class ShmconversationSerializer < ActiveModel::Serializer
  attributes :id, :convChannel, :originalCookID, :originalEaterID
end
