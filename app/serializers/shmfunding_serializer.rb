class ShmfundingSerializer < ActiveModel::Serializer
  attributes :id, :userID, :merchantID, :fundingType, :email, :phoneNumber, :accountNumber, :routingNumber, :fundingDate
end
