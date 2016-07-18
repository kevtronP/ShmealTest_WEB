require 'test_helper'

class ShmmenuitemPhotosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shmmenuitem_photo = shmmenuitem_photos(:one)
  end

  test "should get index" do
    get shmmenuitem_photos_url, as: :json
    assert_response :success
  end

  test "should create shmmenuitem_photo" do
    assert_difference('ShmmenuitemPhoto.count') do
      post shmmenuitem_photos_url, params: { shmmenuitem_photo: { data: @shmmenuitem_photo.data, menuItem: @shmmenuitem_photo.menuItem } }, as: :json
    end

    assert_response 201
  end

  test "should show shmmenuitem_photo" do
    get shmmenuitem_photo_url(@shmmenuitem_photo), as: :json
    assert_response :success
  end

  test "should update shmmenuitem_photo" do
    patch shmmenuitem_photo_url(@shmmenuitem_photo), params: { shmmenuitem_photo: { data: @shmmenuitem_photo.data, menuItem: @shmmenuitem_photo.menuItem } }, as: :json
    assert_response 200
  end

  test "should destroy shmmenuitem_photo" do
    assert_difference('ShmmenuitemPhoto.count', -1) do
      delete shmmenuitem_photo_url(@shmmenuitem_photo), as: :json
    end

    assert_response 204
  end
end
