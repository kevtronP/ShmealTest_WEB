require 'test_helper'

class ShmshmealattributesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shmshmealattribute = shmshmealattributes(:one)
  end

  test "should get index" do
    get shmshmealattributes_url, as: :json
    assert_response :success
  end

  test "should create shmshmealattribute" do
    assert_difference('Shmshmealattribute.count') do
      post shmshmealattributes_url, params: { shmshmealattribute: { attributeDate: @shmshmealattribute.attributeDate, attributeName: @shmshmealattribute.attributeName, shmealAtrbDate: @shmshmealattribute.shmealAtrbDate, shmealAttribute: @shmshmealattribute.shmealAttribute, shmealID: @shmshmealattribute.shmealID } }, as: :json
    end

    assert_response 201
  end

  test "should show shmshmealattribute" do
    get shmshmealattribute_url(@shmshmealattribute), as: :json
    assert_response :success
  end

  test "should update shmshmealattribute" do
    patch shmshmealattribute_url(@shmshmealattribute), params: { shmshmealattribute: { attributeDate: @shmshmealattribute.attributeDate, attributeName: @shmshmealattribute.attributeName, shmealAtrbDate: @shmshmealattribute.shmealAtrbDate, shmealAttribute: @shmshmealattribute.shmealAttribute, shmealID: @shmshmealattribute.shmealID } }, as: :json
    assert_response 200
  end

  test "should destroy shmshmealattribute" do
    assert_difference('Shmshmealattribute.count', -1) do
      delete shmshmealattribute_url(@shmshmealattribute), as: :json
    end

    assert_response 204
  end
end
