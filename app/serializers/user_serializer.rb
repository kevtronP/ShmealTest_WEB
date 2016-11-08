class UserSerializer < ActiveModel::Serializer
  attributes :id, :userEmail, :userName, :userSurname, :userPhoneNumber, :userBlurb, :userInstructions, :homeAddressLat, :homeAddressLon, :profPicURL, :lastMenuItemID, :cookID
end
