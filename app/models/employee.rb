class Employee < ApplicationRecord
  
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'is invalid' }
  validates :name, :address, presence: true
  validates :role, presence:  { message: " Please select a Role" }
  validates :contact_number, presence: true, numericality:  { message: "%{value} seems wrong" }
  validates :experience, presence: true, numericality:  { message: "has to be in number of years" }
end
