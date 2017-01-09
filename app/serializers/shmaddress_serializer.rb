class ShmaddressSerializer < ActiveModel::Serializer
  attributes :id, :firstName, :lastName, :streetAddress, :streetAddress2, :locality, :postalCode, :region, :addressDate, :userID
end
