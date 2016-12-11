require 'test_helper'

class ShmmenuitemstatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shmmenuitemstatus = shmmenuitemstatuses(:one)
  end

  test "should get index" do
    get shmmenuitemstatuses_url, as: :json
    assert_response :success
  end

  test "should create shmmenuitemstatus" do
    assert_difference('Shmmenuitemstatus.count') do
      post shmmenuitemstatuses_url, params: { shmmenuitemstatus: { menuItemID: @shmmenuitemstatus.menuItemID, statusCode: @shmmenuitemstatus.statusCode, statusStartDate: @shmmenuitemstatus.statusStartDate } }, as: :json
    end

    assert_response 201
  end

  test "should show shmmenuitemstatus" do
    get shmmenuitemstatus_url(@shmmenuitemstatus), as: :json
    assert_response :success
  end

  test "should update shmmenuitemstatus" do
    patch shmmenuitemstatus_url(@shmmenuitemstatus), params: { shmmenuitemstatus: { menuItemID: @shmmenuitemstatus.menuItemID, statusCode: @shmmenuitemstatus.statusCode, statusStartDate: @shmmenuitemstatus.statusStartDate } }, as: :json
    assert_response 200
  end

  test "should destroy shmmenuitemstatus" do
    assert_difference('Shmmenuitemstatus.count', -1) do
      delete shmmenuitemstatus_url(@shmmenuitemstatus), as: :json
    end

    assert_response 204
  end
end
