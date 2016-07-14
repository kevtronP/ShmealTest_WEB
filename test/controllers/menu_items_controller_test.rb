require 'test_helper'

class MenuItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @menu_item = menu_items(:one)
  end

  test "should get index" do
    get menu_items_url, as: :json
    assert_response :success
  end

  test "should create menu_item" do
    assert_difference('MenuItem.count') do
      post menu_items_url, params: { menu_item: { lastShmeal_id: @menu_item.lastShmeal_id, mealAllergen1: @menu_item.mealAllergen1, mealBlurb: @menu_item.mealBlurb, mealLastDate: @menu_item.mealLastDate, mealName: @menu_item.mealName, mealQuantity: @menu_item.mealQuantity, mealScore: @menu_item.mealScore, mealThumbnail: @menu_item.mealThumbnail, mealTotalQuantity: @menu_item.mealTotalQuantity, photo_id: @menu_item.photo_id, user_id: @menu_item.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show menu_item" do
    get menu_item_url(@menu_item), as: :json
    assert_response :success
  end

  test "should update menu_item" do
    patch menu_item_url(@menu_item), params: { menu_item: { lastShmeal_id: @menu_item.lastShmeal_id, mealAllergen1: @menu_item.mealAllergen1, mealBlurb: @menu_item.mealBlurb, mealLastDate: @menu_item.mealLastDate, mealName: @menu_item.mealName, mealQuantity: @menu_item.mealQuantity, mealScore: @menu_item.mealScore, mealThumbnail: @menu_item.mealThumbnail, mealTotalQuantity: @menu_item.mealTotalQuantity, photo_id: @menu_item.photo_id, user_id: @menu_item.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy menu_item" do
    assert_difference('MenuItem.count', -1) do
      delete menu_item_url(@menu_item), as: :json
    end

    assert_response 204
  end
end
