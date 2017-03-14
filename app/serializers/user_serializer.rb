class UserSerializer < ActiveModel::Serializer
  attributes :id, :userEmail, :userPhoneNumber, :userName, :lastName, :userDate
end
