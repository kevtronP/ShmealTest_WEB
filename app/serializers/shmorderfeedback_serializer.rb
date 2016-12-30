class ShmorderfeedbackSerializer < ActiveModel::Serializer
  attributes :id, :requestID, :feedbackScore, :feedbackComment, :feedbackTime
end
