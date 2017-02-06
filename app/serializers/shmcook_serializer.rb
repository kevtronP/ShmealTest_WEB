class ShmcookSerializer < ActiveModel::Serializer
  attributes :id, :merchantID, :taxpayerID, :firstName, :surName, :birthDateString, :email, :phoneNumber, :streetAddress, :locality, :region, :postalCode, :fundingType, :accountNumber, :routingNumber, :userID, :cookDate
end
