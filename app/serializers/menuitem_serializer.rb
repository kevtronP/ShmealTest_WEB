class MenuitemSerializer < ActiveModel::Serializer
  attributes :id, :mealName, :userID, :menuItemDate, :user
  has_one :user
end
