class ShmcookSerializer < ActiveModel::Serializer
  attributes :id, :merchantID, :taxpayerID, :firstName, :surName, :birthDateString, :email, :phoneNumber, :streetAddress, :locality, :region, :postalCode, :fundingType, :accountNumber, :routingNumber, :userID, :cookDate
  has_many :shmcookstatuses
  has_many :shmuserstatuses
  has_many :shmconversations
  has_many :shmorders
end
