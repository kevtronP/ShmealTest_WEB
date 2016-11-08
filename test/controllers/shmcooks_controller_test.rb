require 'test_helper'

class ShmcooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shmcook = shmcooks(:one)
  end

  test "should get index" do
    get shmcooks_url, as: :json
    assert_response :success
  end

  test "should create shmcook" do
    assert_difference('Shmcook.count') do
      post shmcooks_url, params: { shmcook: { taxpayerID: @shmcook.taxpayerID, userID: @shmcook.userID } }, as: :json
    end

    assert_response 201
  end

  test "should show shmcook" do
    get shmcook_url(@shmcook), as: :json
    assert_response :success
  end

  test "should update shmcook" do
    patch shmcook_url(@shmcook), params: { shmcook: { taxpayerID: @shmcook.taxpayerID, userID: @shmcook.userID } }, as: :json
    assert_response 200
  end

  test "should destroy shmcook" do
    assert_difference('Shmcook.count', -1) do
      delete shmcook_url(@shmcook), as: :json
    end

    assert_response 204
  end
end
