require 'test_helper'

class ShmcheckoutsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shmcheckout = shmcheckouts(:one)
  end

  test "should get index" do
    get shmcheckouts_url, as: :json
    assert_response :success
  end

  test "should create shmcheckout" do
    assert_difference('Shmcheckout.count') do
      post shmcheckouts_url, params: { shmcheckout: { amount: @shmcheckout.amount, deviceData: @shmcheckout.deviceData, feeAmount: @shmcheckout.feeAmount, merchantID: @shmcheckout.merchantID, nonce: @shmcheckout.nonce } }, as: :json
    end

    assert_response 201
  end

  test "should show shmcheckout" do
    get shmcheckout_url(@shmcheckout), as: :json
    assert_response :success
  end

  test "should update shmcheckout" do
    patch shmcheckout_url(@shmcheckout), params: { shmcheckout: { amount: @shmcheckout.amount, deviceData: @shmcheckout.deviceData, feeAmount: @shmcheckout.feeAmount, merchantID: @shmcheckout.merchantID, nonce: @shmcheckout.nonce } }, as: :json
    assert_response 200
  end

  test "should destroy shmcheckout" do
    assert_difference('Shmcheckout.count', -1) do
      delete shmcheckout_url(@shmcheckout), as: :json
    end

    assert_response 204
  end
end
