class InterviewFeedback < ApplicationRecord
  belongs_to :interview
  has_many :interview_answer_ratings, dependent: :delete_all
	has_many :question_banks, through: :interview_answer_ratings
  accepts_nested_attributes_for :interview_answer_ratings, allow_destroy: true, reject_if: :all_blank
  validates :soft_skill_rating, :skill_rating, :final_rating, presence: :true
end
