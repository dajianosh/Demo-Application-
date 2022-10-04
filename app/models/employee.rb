class Employee < ApplicationRecord
  has_many :user_skills, as: :skillable
  has_many :skills, through: :user_skills
  has_one_attached :profile_photo
  
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'is invalid' }
  validates :name, :address, presence: true
  validates :role, presence:  { message: "Please select a Role" }
  validates :contact_number, presence: true, numericality:  { message: "%{value} seems wrong" }
  validates :experience, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
