require 'test_helper'

class ShmfundingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shmfunding = shmfundings(:one)
  end

  test "should get index" do
    get shmfundings_url, as: :json
    assert_response :success
  end

  test "should create shmfunding" do
    assert_difference('Shmfunding.count') do
      post shmfundings_url, params: { shmfunding: { accountNumber: @shmfunding.accountNumber, email: @shmfunding.email, fundingDate: @shmfunding.fundingDate, fundingType: @shmfunding.fundingType, merchantID: @shmfunding.merchantID, phoneNumber: @shmfunding.phoneNumber, routingNumber: @shmfunding.routingNumber, userID: @shmfunding.userID } }, as: :json
    end

    assert_response 201
  end

  test "should show shmfunding" do
    get shmfunding_url(@shmfunding), as: :json
    assert_response :success
  end

  test "should update shmfunding" do
    patch shmfunding_url(@shmfunding), params: { shmfunding: { accountNumber: @shmfunding.accountNumber, email: @shmfunding.email, fundingDate: @shmfunding.fundingDate, fundingType: @shmfunding.fundingType, merchantID: @shmfunding.merchantID, phoneNumber: @shmfunding.phoneNumber, routingNumber: @shmfunding.routingNumber, userID: @shmfunding.userID } }, as: :json
    assert_response 200
  end

  test "should destroy shmfunding" do
    assert_difference('Shmfunding.count', -1) do
      delete shmfunding_url(@shmfunding), as: :json
    end

    assert_response 204
  end
end
