class Candidate < ApplicationRecord
  has_many :user_skills, as: :skillable, dependent: :destroy
  has_many :skills, through: :user_skills
  has_many :interviews, dependent: :destroy
  has_many :employees, through: :interviews
  has_one_attached :profile_photo

  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'is invalid' }
  validates :name, :address, presence: true
  validates :contact_number, presence: true, numericality: { message: "%{value} seems wrong" }
  validates :experience, presence: true, numericality: { greater_than_or_equal_to: 0 }

end
