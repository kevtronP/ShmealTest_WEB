class MenuitemSerializer < ActiveModel::Serializer
  attributes :id, :mealName, :userID, :menuItemDate
  has_many :shmeals
end
