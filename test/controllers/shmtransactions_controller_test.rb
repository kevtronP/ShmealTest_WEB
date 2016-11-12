require 'test_helper'

class ShmtransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shmtransaction = shmtransactions(:one)
  end

  test "should get index" do
    get shmtransactions_url, as: :json
    assert_response :success
  end

  test "should create shmtransaction" do
    assert_difference('Shmtransaction.count') do
      post shmtransactions_url, params: { shmtransaction: { client_token: @shmtransaction.client_token, paymentType: @shmtransaction.paymentType, payment_token: @shmtransaction.payment_token } }, as: :json
    end

    assert_response 201
  end

  test "should show shmtransaction" do
    get shmtransaction_url(@shmtransaction), as: :json
    assert_response :success
  end

  test "should update shmtransaction" do
    patch shmtransaction_url(@shmtransaction), params: { shmtransaction: { client_token: @shmtransaction.client_token, paymentType: @shmtransaction.paymentType, payment_token: @shmtransaction.payment_token } }, as: :json
    assert_response 200
  end

  test "should destroy shmtransaction" do
    assert_difference('Shmtransaction.count', -1) do
      delete shmtransaction_url(@shmtransaction), as: :json
    end

    assert_response 204
  end
end
