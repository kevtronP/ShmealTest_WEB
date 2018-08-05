require 'test_helper'

class ShmorderfeedbacksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shmorderfeedback = shmorderfeedbacks(:one)
  end

  test "should get index" do
    get shmorderfeedbacks_url, as: :json
    assert_response :success
  end

  test "should create shmorderfeedback" do
    assert_difference('Shmorderfeedback.count') do
      post shmorderfeedbacks_url, params: { shmorderfeedback: { feedbackComment: @shmorderfeedback.feedbackComment, feedbackScore: @shmorderfeedback.feedbackScore, feedbackTime: @shmorderfeedback.feedbackTime, requestID: @shmorderfeedback.requestID } }, as: :json
    end

    assert_response 201
  end

  test "should show shmorderfeedback" do
    get shmorderfeedback_url(@shmorderfeedback), as: :json
    assert_response :success
  end

  test "should update shmorderfeedback" do
    patch shmorderfeedback_url(@shmorderfeedback), params: { shmorderfeedback: { feedbackComment: @shmorderfeedback.feedbackComment, feedbackScore: @shmorderfeedback.feedbackScore, feedbackTime: @shmorderfeedback.feedbackTime, requestID: @shmorderfeedback.requestID } }, as: :json
    assert_response 200
  end

  test "should destroy shmorderfeedback" do
    assert_difference('Shmorderfeedback.count', -1) do
      delete shmorderfeedback_url(@shmorderfeedback), as: :json
    end

    assert_response 204
  end
end
