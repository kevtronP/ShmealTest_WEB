class ShmaddressSerializer < ActiveModel::Serializer
  attributes :id, :streetAddress, :streetAddress2, :locality, :postalCode, :region, :userID
end
