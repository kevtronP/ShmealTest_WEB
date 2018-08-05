require 'test_helper'

class ShmpaymentmethodstatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shmpaymentmethodstatus = shmpaymentmethodstatuses(:one)
  end

  test "should get index" do
    get shmpaymentmethodstatuses_url, as: :json
    assert_response :success
  end

  test "should create shmpaymentmethodstatus" do
    assert_difference('Shmpaymentmethodstatus.count') do
      post shmpaymentmethodstatuses_url, params: { shmpaymentmethodstatus: { paymentMethodID: @shmpaymentmethodstatus.paymentMethodID, statusCode: @shmpaymentmethodstatus.statusCode, statusStartDate: @shmpaymentmethodstatus.statusStartDate } }, as: :json
    end

    assert_response 201
  end

  test "should show shmpaymentmethodstatus" do
    get shmpaymentmethodstatus_url(@shmpaymentmethodstatus), as: :json
    assert_response :success
  end

  test "should update shmpaymentmethodstatus" do
    patch shmpaymentmethodstatus_url(@shmpaymentmethodstatus), params: { shmpaymentmethodstatus: { paymentMethodID: @shmpaymentmethodstatus.paymentMethodID, statusCode: @shmpaymentmethodstatus.statusCode, statusStartDate: @shmpaymentmethodstatus.statusStartDate } }, as: :json
    assert_response 200
  end

  test "should destroy shmpaymentmethodstatus" do
    assert_difference('Shmpaymentmethodstatus.count', -1) do
      delete shmpaymentmethodstatus_url(@shmpaymentmethodstatus), as: :json
    end

    assert_response 204
  end
end
