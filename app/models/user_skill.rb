class UserSkill < ApplicationRecord
  belongs_to :skill
  belongs_to :skillable, polymorphic: true
end
