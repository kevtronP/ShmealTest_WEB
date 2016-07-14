class UserSerializer < ActiveModel::Serializer
  attributes :id, :homeAddressLat, :homeAddressLon, :userBlurb, :userEmail, :userInstructions, :userName, :userPhoneNumber, :userScore, :userThumbnail, :userTotalShmeals, :lastMenuItem_id
end
