require 'test_helper'

class MerchantwebhooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @merchantwebhook = merchantwebhooks(:one)
  end

  test "should get index" do
    get merchantwebhooks_url, as: :json
    assert_response :success
  end

  test "should create merchantwebhook" do
    assert_difference('Merchantwebhook.count') do
      post merchantwebhooks_url, params: { merchantwebhook: { kind: @merchantwebhook.kind, notificationTime: @merchantwebhook.notificationTime } }, as: :json
    end

    assert_response 201
  end

  test "should show merchantwebhook" do
    get merchantwebhook_url(@merchantwebhook), as: :json
    assert_response :success
  end

  test "should update merchantwebhook" do
    patch merchantwebhook_url(@merchantwebhook), params: { merchantwebhook: { kind: @merchantwebhook.kind, notificationTime: @merchantwebhook.notificationTime } }, as: :json
    assert_response 200
  end

  test "should destroy merchantwebhook" do
    assert_difference('Merchantwebhook.count', -1) do
      delete merchantwebhook_url(@merchantwebhook), as: :json
    end

    assert_response 204
  end
end
