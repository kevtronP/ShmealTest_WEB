require 'test_helper'

class ShmrequeststatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shmrequeststatus = shmrequeststatuses(:one)
  end

  test "should get index" do
    get shmrequeststatuses_url, as: :json
    assert_response :success
  end

  test "should create shmrequeststatus" do
    assert_difference('Shmrequeststatus.count') do
      post shmrequeststatuses_url, params: { shmrequeststatus: { requestID: @shmrequeststatus.requestID, statusCode: @shmrequeststatus.statusCode, statusStartDate: @shmrequeststatus.statusStartDate } }, as: :json
    end

    assert_response 201
  end

  test "should show shmrequeststatus" do
    get shmrequeststatus_url(@shmrequeststatus), as: :json
    assert_response :success
  end

  test "should update shmrequeststatus" do
    patch shmrequeststatus_url(@shmrequeststatus), params: { shmrequeststatus: { requestID: @shmrequeststatus.requestID, statusCode: @shmrequeststatus.statusCode, statusStartDate: @shmrequeststatus.statusStartDate } }, as: :json
    assert_response 200
  end

  test "should destroy shmrequeststatus" do
    assert_difference('Shmrequeststatus.count', -1) do
      delete shmrequeststatus_url(@shmrequeststatus), as: :json
    end

    assert_response 204
  end
end
