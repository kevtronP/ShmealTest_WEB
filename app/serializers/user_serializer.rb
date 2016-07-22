class UserSerializer < ActiveModel::Serializer
  attributes :id, :homeAddressLat, :homeAddressLon, :userBlurb, :userEmail, :userInstructions, :userName, :userPhoneNumber, :userScore, :userThumbnail, :profPicURL, :userTotalShmeals, :lastMenuItem_id
end
