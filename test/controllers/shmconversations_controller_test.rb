require 'test_helper'

class ShmconversationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shmconversation = shmconversations(:one)
  end

  test "should get index" do
    get shmconversations_url, as: :json
    assert_response :success
  end

  test "should create shmconversation" do
    assert_difference('Shmconversation.count') do
      post shmconversations_url, params: { shmconversation: { convChannel: @shmconversation.convChannel, convStartDate: @shmconversation.convStartDate, originalCookID: @shmconversation.originalCookID, originalEaterID: @shmconversation.originalEaterID } }, as: :json
    end

    assert_response 201
  end

  test "should show shmconversation" do
    get shmconversation_url(@shmconversation), as: :json
    assert_response :success
  end

  test "should update shmconversation" do
    patch shmconversation_url(@shmconversation), params: { shmconversation: { convChannel: @shmconversation.convChannel, convStartDate: @shmconversation.convStartDate, originalCookID: @shmconversation.originalCookID, originalEaterID: @shmconversation.originalEaterID } }, as: :json
    assert_response 200
  end

  test "should destroy shmconversation" do
    assert_difference('Shmconversation.count', -1) do
      delete shmconversation_url(@shmconversation), as: :json
    end

    assert_response 204
  end
end
