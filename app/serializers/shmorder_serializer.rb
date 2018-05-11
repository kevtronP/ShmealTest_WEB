class ShmorderSerializer < ActiveModel::Serializer
  attributes :id, :orderDay, :orderTime, :conversationID, :shmealID, :eaterID, :cookID, :review_ignored
  #has_many :shmrequestattributes
  #has_many :shmrequeststatuses
  #has_many :shmorderfeedbacks
end
