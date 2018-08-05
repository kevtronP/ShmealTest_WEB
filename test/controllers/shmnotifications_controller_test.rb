require 'test_helper'

class ShmnotificationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shmnotification = shmnotifications(:one)
  end

  test "should get index" do
    get shmnotifications_url, as: :json
    assert_response :success
  end

  test "should create shmnotification" do
    assert_difference('Shmnotification.count') do
      post shmnotifications_url, params: { shmnotification: { menuItemID: @shmnotification.menuItemID, notificationDate: @shmnotification.notificationDate, notificationMessage: @shmnotification.notificationMessage, otherUserID: @shmnotification.otherUserID, unfollowTimeStamp: @shmnotification.unfollowTimeStamp, userID: @shmnotification.userID } }, as: :json
    end

    assert_response 201
  end

  test "should show shmnotification" do
    get shmnotification_url(@shmnotification), as: :json
    assert_response :success
  end

  test "should update shmnotification" do
    patch shmnotification_url(@shmnotification), params: { shmnotification: { menuItemID: @shmnotification.menuItemID, notificationDate: @shmnotification.notificationDate, notificationMessage: @shmnotification.notificationMessage, otherUserID: @shmnotification.otherUserID, unfollowTimeStamp: @shmnotification.unfollowTimeStamp, userID: @shmnotification.userID } }, as: :json
    assert_response 200
  end

  test "should destroy shmnotification" do
    assert_difference('Shmnotification.count', -1) do
      delete shmnotification_url(@shmnotification), as: :json
    end

    assert_response 204
  end
end
