require 'test_helper'

class ShmuserstatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shmuserstatus = shmuserstatuses(:one)
  end

  test "should get index" do
    get shmuserstatuses_url, as: :json
    assert_response :success
  end

  test "should create shmuserstatus" do
    assert_difference('Shmuserstatus.count') do
      post shmuserstatuses_url, params: { shmuserstatus: { receivingUserID: @shmuserstatus.receivingUserID, sendingUserID: @shmuserstatus.sendingUserID, statusCode: @shmuserstatus.statusCode, statusStartDate: @shmuserstatus.statusStartDate } }, as: :json
    end

    assert_response 201
  end

  test "should show shmuserstatus" do
    get shmuserstatus_url(@shmuserstatus), as: :json
    assert_response :success
  end

  test "should update shmuserstatus" do
    patch shmuserstatus_url(@shmuserstatus), params: { shmuserstatus: { receivingUserID: @shmuserstatus.receivingUserID, sendingUserID: @shmuserstatus.sendingUserID, statusCode: @shmuserstatus.statusCode, statusStartDate: @shmuserstatus.statusStartDate } }, as: :json
    assert_response 200
  end

  test "should destroy shmuserstatus" do
    assert_difference('Shmuserstatus.count', -1) do
      delete shmuserstatus_url(@shmuserstatus), as: :json
    end

    assert_response 204
  end
end
