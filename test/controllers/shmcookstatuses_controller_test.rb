require 'test_helper'

class ShmcookstatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shmcookstatus = shmcookstatuses(:one)
  end

  test "should get index" do
    get shmcookstatuses_url, as: :json
    assert_response :success
  end

  test "should create shmcookstatus" do
    assert_difference('Shmcookstatus.count') do
      post shmcookstatuses_url, params: { shmcookstatus: { cookID: @shmcookstatus.cookID, statusCode: @shmcookstatus.statusCode, statusStartDate: @shmcookstatus.statusStartDate } }, as: :json
    end

    assert_response 201
  end

  test "should show shmcookstatus" do
    get shmcookstatus_url(@shmcookstatus), as: :json
    assert_response :success
  end

  test "should update shmcookstatus" do
    patch shmcookstatus_url(@shmcookstatus), params: { shmcookstatus: { cookID: @shmcookstatus.cookID, statusCode: @shmcookstatus.statusCode, statusStartDate: @shmcookstatus.statusStartDate } }, as: :json
    assert_response 200
  end

  test "should destroy shmcookstatus" do
    assert_difference('Shmcookstatus.count', -1) do
      delete shmcookstatus_url(@shmcookstatus), as: :json
    end

    assert_response 204
  end
end
