class InterviewAnswerRating < ApplicationRecord
  belongs_to :interview_feedback
  belongs_to :question_bank
end
