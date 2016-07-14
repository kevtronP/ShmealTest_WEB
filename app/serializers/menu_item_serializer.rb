class MenuItemSerializer < ActiveModel::Serializer
  attributes :id, :mealAllergen1, :mealBlurb, :mealLastDate, :mealName, :mealQuantity, :mealScore, :mealThumbnail, :mealTotalQuantity, :lastShmeal_id, :photo_id, :user_id
end
