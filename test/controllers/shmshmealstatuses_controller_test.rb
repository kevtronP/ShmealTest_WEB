require 'test_helper'

class ShmshmealstatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shmshmealstatus = shmshmealstatuses(:one)
  end

  test "should get index" do
    get shmshmealstatuses_url, as: :json
    assert_response :success
  end

  test "should create shmshmealstatus" do
    assert_difference('Shmshmealstatus.count') do
      post shmshmealstatuses_url, params: { shmshmealstatus: { shmealID: @shmshmealstatus.shmealID, statusCode: @shmshmealstatus.statusCode, statusStartDate: @shmshmealstatus.statusStartDate } }, as: :json
    end

    assert_response 201
  end

  test "should show shmshmealstatus" do
    get shmshmealstatus_url(@shmshmealstatus), as: :json
    assert_response :success
  end

  test "should update shmshmealstatus" do
    patch shmshmealstatus_url(@shmshmealstatus), params: { shmshmealstatus: { shmealID: @shmshmealstatus.shmealID, statusCode: @shmshmealstatus.statusCode, statusStartDate: @shmshmealstatus.statusStartDate } }, as: :json
    assert_response 200
  end

  test "should destroy shmshmealstatus" do
    assert_difference('Shmshmealstatus.count', -1) do
      delete shmshmealstatus_url(@shmshmealstatus), as: :json
    end

    assert_response 204
  end
end
