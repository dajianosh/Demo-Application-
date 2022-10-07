class QuestionBank < ApplicationRecord
  has_many :interview_answer_ratings
	has_many :interview_feedbacks, through: :interview_answer_ratings
end
