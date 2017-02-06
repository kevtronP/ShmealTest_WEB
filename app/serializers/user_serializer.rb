class UserSerializer < ActiveModel::Serializer
  attributes :id, :userEmail, :userPhoneNumber, :userName, :userDate
end
