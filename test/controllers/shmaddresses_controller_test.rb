require 'test_helper'

class ShmaddressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shmaddress = shmaddresses(:one)
  end

  test "should get index" do
    get shmaddresses_url, as: :json
    assert_response :success
  end

  test "should create shmaddress" do
    assert_difference('Shmaddress.count') do
      post shmaddresses_url, params: { shmaddress: { locality: @shmaddress.locality, postalCode: @shmaddress.postalCode, region: @shmaddress.region, streetAddress2: @shmaddress.streetAddress2, streetAddress: @shmaddress.streetAddress, userID: @shmaddress.userID } }, as: :json
    end

    assert_response 201
  end

  test "should show shmaddress" do
    get shmaddress_url(@shmaddress), as: :json
    assert_response :success
  end

  test "should update shmaddress" do
    patch shmaddress_url(@shmaddress), params: { shmaddress: { locality: @shmaddress.locality, postalCode: @shmaddress.postalCode, region: @shmaddress.region, streetAddress2: @shmaddress.streetAddress2, streetAddress: @shmaddress.streetAddress, userID: @shmaddress.userID } }, as: :json
    assert_response 200
  end

  test "should destroy shmaddress" do
    assert_difference('Shmaddress.count', -1) do
      delete shmaddress_url(@shmaddress), as: :json
    end

    assert_response 204
  end
end
