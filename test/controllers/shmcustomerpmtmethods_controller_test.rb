require 'test_helper'

class ShmcustomerpmtmethodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shmcustomerpmtmethod = shmcustomerpmtmethods(:one)
  end

  test "should get index" do
    get shmcustomerpmtmethods_url, as: :json
    assert_response :success
  end

  test "should create shmcustomerpmtmethod" do
    assert_difference('Shmcustomerpmtmethod.count') do
      post shmcustomerpmtmethods_url, params: { shmcustomerpmtmethod: { cardLastFour: @shmcustomerpmtmethod.cardLastFour, customerIDString: @shmcustomerpmtmethod.customerIDString, firstName: @shmcustomerpmtmethod.firstName, lastName: @shmcustomerpmtmethod.lastName, nonce: @shmcustomerpmtmethod.nonce, paymentMethodToken: @shmcustomerpmtmethod.paymentMethodToken, paymentType: @shmcustomerpmtmethod.paymentType, userID: @shmcustomerpmtmethod.userID, venmoName: @shmcustomerpmtmethod.venmoName } }, as: :json
    end

    assert_response 201
  end

  test "should show shmcustomerpmtmethod" do
    get shmcustomerpmtmethod_url(@shmcustomerpmtmethod), as: :json
    assert_response :success
  end

  test "should update shmcustomerpmtmethod" do
    patch shmcustomerpmtmethod_url(@shmcustomerpmtmethod), params: { shmcustomerpmtmethod: { cardLastFour: @shmcustomerpmtmethod.cardLastFour, customerIDString: @shmcustomerpmtmethod.customerIDString, firstName: @shmcustomerpmtmethod.firstName, lastName: @shmcustomerpmtmethod.lastName, nonce: @shmcustomerpmtmethod.nonce, paymentMethodToken: @shmcustomerpmtmethod.paymentMethodToken, paymentType: @shmcustomerpmtmethod.paymentType, userID: @shmcustomerpmtmethod.userID, venmoName: @shmcustomerpmtmethod.venmoName } }, as: :json
    assert_response 200
  end

  test "should destroy shmcustomerpmtmethod" do
    assert_difference('Shmcustomerpmtmethod.count', -1) do
      delete shmcustomerpmtmethod_url(@shmcustomerpmtmethod), as: :json
    end

    assert_response 204
  end
end
