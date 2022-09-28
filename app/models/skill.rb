class Skill < ApplicationRecord
  has_many :user_skills

  validates :name, presence: true, uniqueness:  { message: "This Skill already exists" }
end
