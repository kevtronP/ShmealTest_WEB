require 'test_helper'

class ShmcheckinsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shmcheckin = shmcheckins(:one)
  end

  test "should get index" do
    get shmcheckins_url, as: :json
    assert_response :success
  end

  test "should create shmcheckin" do
    assert_difference('Shmcheckin.count') do
      post shmcheckins_url, params: { shmcheckin: { checkInTime: @shmcheckin.checkInTime, conversationID: @shmcheckin.conversationID, messageSent: @shmcheckin.messageSent, userID: @shmcheckin.userID } }, as: :json
    end

    assert_response 201
  end

  test "should show shmcheckin" do
    get shmcheckin_url(@shmcheckin), as: :json
    assert_response :success
  end

  test "should update shmcheckin" do
    patch shmcheckin_url(@shmcheckin), params: { shmcheckin: { checkInTime: @shmcheckin.checkInTime, conversationID: @shmcheckin.conversationID, messageSent: @shmcheckin.messageSent, userID: @shmcheckin.userID } }, as: :json
    assert_response 200
  end

  test "should destroy shmcheckin" do
    assert_difference('Shmcheckin.count', -1) do
      delete shmcheckin_url(@shmcheckin), as: :json
    end

    assert_response 204
  end
end
