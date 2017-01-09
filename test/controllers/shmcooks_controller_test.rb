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
      post shmcooks_url, params: { shmcook: { accountNumber: @shmcook.accountNumber, birthDateString: @shmcook.birthDateString, email: @shmcook.email, firstName: @shmcook.firstName, fundingType: @shmcook.fundingType, locality: @shmcook.locality, merchantID: @shmcook.merchantID, phoneNumber: @shmcook.phoneNumber, postalCode: @shmcook.postalCode, region: @shmcook.region, routingNumber: @shmcook.routingNumber, streetAddress: @shmcook.streetAddress, surName: @shmcook.surName, taxpayerID: @shmcook.taxpayerID, userID: @shmcook.userID } }, as: :json
    end

    assert_response 201
  end

  test "should show shmcook" do
    get shmcook_url(@shmcook), as: :json
    assert_response :success
  end

  test "should update shmcook" do
    patch shmcook_url(@shmcook), params: { shmcook: { accountNumber: @shmcook.accountNumber, birthDateString: @shmcook.birthDateString, email: @shmcook.email, firstName: @shmcook.firstName, fundingType: @shmcook.fundingType, locality: @shmcook.locality, merchantID: @shmcook.merchantID, phoneNumber: @shmcook.phoneNumber, postalCode: @shmcook.postalCode, region: @shmcook.region, routingNumber: @shmcook.routingNumber, streetAddress: @shmcook.streetAddress, surName: @shmcook.surName, taxpayerID: @shmcook.taxpayerID, userID: @shmcook.userID } }, as: :json
    assert_response 200
  end

  test "should destroy shmcook" do
    assert_difference('Shmcook.count', -1) do
      delete shmcook_url(@shmcook), as: :json
    end

    assert_response 204
  end
end
