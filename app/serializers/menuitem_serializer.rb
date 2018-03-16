class MenuitemSerializer < ActiveModel::Serializer
  attributes :id, :mealName, :userID, :menuItemDate

  has_one :user
  
end
