require 'test_helper'

class ShmpaymentnoncesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shmpaymentnonce = shmpaymentnonces(:one)
  end

  test "should get index" do
    get shmpaymentnonces_url, as: :json
    assert_response :success
  end

  test "should create shmpaymentnonce" do
    assert_difference('Shmpaymentnonce.count') do
      post shmpaymentnonces_url, params: { shmpaymentnonce: { paymentMethodToken: @shmpaymentnonce.paymentMethodToken, paymentNonce: @shmpaymentnonce.paymentNonce } }, as: :json
    end

    assert_response 201
  end

  test "should show shmpaymentnonce" do
    get shmpaymentnonce_url(@shmpaymentnonce), as: :json
    assert_response :success
  end

  test "should update shmpaymentnonce" do
    patch shmpaymentnonce_url(@shmpaymentnonce), params: { shmpaymentnonce: { paymentMethodToken: @shmpaymentnonce.paymentMethodToken, paymentNonce: @shmpaymentnonce.paymentNonce } }, as: :json
    assert_response 200
  end

  test "should destroy shmpaymentnonce" do
    assert_difference('Shmpaymentnonce.count', -1) do
      delete shmpaymentnonce_url(@shmpaymentnonce), as: :json
    end

    assert_response 204
  end
end
