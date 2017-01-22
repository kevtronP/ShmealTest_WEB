require 'test_helper'

class ShmrequestattributesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shmrequestattribute = shmrequestattributes(:one)
  end

  test "should get index" do
    get shmrequestattributes_url, as: :json
    assert_response :success
  end

  test "should create shmrequestattribute" do
    assert_difference('Shmrequestattribute.count') do
      post shmrequestattributes_url, params: { shmrequestattribute: { attributeDate: @shmrequestattribute.attributeDate, attributeName: @shmrequestattribute.attributeName, requestAttribute: @shmrequestattribute.requestAttribute, requestDateAtrb: @shmrequestattribute.requestDateAtrb, requestID: @shmrequestattribute.requestID } }, as: :json
    end

    assert_response 201
  end

  test "should show shmrequestattribute" do
    get shmrequestattribute_url(@shmrequestattribute), as: :json
    assert_response :success
  end

  test "should update shmrequestattribute" do
    patch shmrequestattribute_url(@shmrequestattribute), params: { shmrequestattribute: { attributeDate: @shmrequestattribute.attributeDate, attributeName: @shmrequestattribute.attributeName, requestAttribute: @shmrequestattribute.requestAttribute, requestDateAtrb: @shmrequestattribute.requestDateAtrb, requestID: @shmrequestattribute.requestID } }, as: :json
    assert_response 200
  end

  test "should destroy shmrequestattribute" do
    assert_difference('Shmrequestattribute.count', -1) do
      delete shmrequestattribute_url(@shmrequestattribute), as: :json
    end

    assert_response 204
  end
end
