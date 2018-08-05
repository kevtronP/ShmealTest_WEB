require 'test_helper'

class ShmuserattributesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shmuserattribute = shmuserattributes(:one)
  end

  test "should get index" do
    get shmuserattributes_url, as: :json
    assert_response :success
  end

  test "should create shmuserattribute" do
    assert_difference('Shmuserattribute.count') do
      post shmuserattributes_url, params: { shmuserattribute: { attributeDate: @shmuserattribute.attributeDate, attributeName: @shmuserattribute.attributeName, userAttribute: @shmuserattribute.userAttribute, userID: @shmuserattribute.userID } }, as: :json
    end

    assert_response 201
  end

  test "should show shmuserattribute" do
    get shmuserattribute_url(@shmuserattribute), as: :json
    assert_response :success
  end

  test "should update shmuserattribute" do
    patch shmuserattribute_url(@shmuserattribute), params: { shmuserattribute: { attributeDate: @shmuserattribute.attributeDate, attributeName: @shmuserattribute.attributeName, userAttribute: @shmuserattribute.userAttribute, userID: @shmuserattribute.userID } }, as: :json
    assert_response 200
  end

  test "should destroy shmuserattribute" do
    assert_difference('Shmuserattribute.count', -1) do
      delete shmuserattribute_url(@shmuserattribute), as: :json
    end

    assert_response 204
  end
end
