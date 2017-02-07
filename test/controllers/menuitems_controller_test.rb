require 'test_helper'

class MenuitemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @menuitem = menuitems(:one)
  end

  test "should get index" do
    get menuitems_url, as: :json
    assert_response :success
  end

  test "should create menuitem" do
    assert_difference('Menuitem.count') do
      post menuitems_url, params: { menuitem: { mealName: @menuitem.mealName, menuItemDate: @menuitem.menuItemDate, userID: @menuitem.userID } }, as: :json
    end

    assert_response 201
  end

  test "should show menuitem" do
    get menuitem_url(@menuitem), as: :json
    assert_response :success
  end

  test "should update menuitem" do
    patch menuitem_url(@menuitem), params: { menuitem: { mealName: @menuitem.mealName, menuItemDate: @menuitem.menuItemDate, userID: @menuitem.userID } }, as: :json
    assert_response 200
  end

  test "should destroy menuitem" do
    assert_difference('Menuitem.count', -1) do
      delete menuitem_url(@menuitem), as: :json
    end

    assert_response 204
  end
end
