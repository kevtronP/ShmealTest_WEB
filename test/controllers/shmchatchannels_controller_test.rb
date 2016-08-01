require 'test_helper'

class ShmchatchannelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shmchatchannel = shmchatchannels(:one)
  end

  test "should get index" do
    get shmchatchannels_url, as: :json
    assert_response :success
  end

  test "should create shmchatchannel" do
    assert_difference('Shmchatchannel.count') do
      post shmchatchannels_url, params: { shmchatchannel: { chatChannel: @shmchatchannel.chatChannel, chatCheckIn1: @shmchatchannel.chatCheckIn1, chatCheckIn2: @shmchatchannel.chatCheckIn2, chatUser1: @shmchatchannel.chatUser1, chatUser2: @shmchatchannel.chatUser2 } }, as: :json
    end

    assert_response 201
  end

  test "should show shmchatchannel" do
    get shmchatchannel_url(@shmchatchannel), as: :json
    assert_response :success
  end

  test "should update shmchatchannel" do
    patch shmchatchannel_url(@shmchatchannel), params: { shmchatchannel: { chatChannel: @shmchatchannel.chatChannel, chatCheckIn1: @shmchatchannel.chatCheckIn1, chatCheckIn2: @shmchatchannel.chatCheckIn2, chatUser1: @shmchatchannel.chatUser1, chatUser2: @shmchatchannel.chatUser2 } }, as: :json
    assert_response 200
  end

  test "should destroy shmchatchannel" do
    assert_difference('Shmchatchannel.count', -1) do
      delete shmchatchannel_url(@shmchatchannel), as: :json
    end

    assert_response 204
  end
end
