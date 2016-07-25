require 'test_helper'

class ShmealsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shmeal = shmeals(:one)
  end

  test "should get index" do
    get shmeals_url, as: :json
    assert_response :success
  end

  test "should create shmeal" do
    assert_difference('Shmeal.count') do
      post shmeals_url, params: { shmeal: { menuItemID: @shmeal.menuItemID, shmealDayDate: @shmeal.shmealDayDate, shmealEndTime: @shmeal.shmealEndTime, shmealLat: @shmeal.shmealLat, shmealLon: @shmeal.shmealLon, shmealPostDate: @shmeal.shmealPostDate, shmealQuantity: @shmeal.shmealQuantity, shmealScore: @shmeal.shmealScore, shmealStartTime: @shmeal.shmealStartTime } }, as: :json
    end

    assert_response 201
  end

  test "should show shmeal" do
    get shmeal_url(@shmeal), as: :json
    assert_response :success
  end

  test "should update shmeal" do
    patch shmeal_url(@shmeal), params: { shmeal: { menuItemID: @shmeal.menuItemID, shmealDayDate: @shmeal.shmealDayDate, shmealEndTime: @shmeal.shmealEndTime, shmealLat: @shmeal.shmealLat, shmealLon: @shmeal.shmealLon, shmealPostDate: @shmeal.shmealPostDate, shmealQuantity: @shmeal.shmealQuantity, shmealScore: @shmeal.shmealScore, shmealStartTime: @shmeal.shmealStartTime } }, as: :json
    assert_response 200
  end

  test "should destroy shmeal" do
    assert_difference('Shmeal.count', -1) do
      delete shmeal_url(@shmeal), as: :json
    end

    assert_response 204
  end
end
