class Employee < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'is invalid' }
  validates :password, length: {minimum: 4}
  validates :name, :address, presence: true
  validates :role, presence:  { message: "Please select a Role" }
  validates :contact_number, presence: true, numericality:  { message: "%{value} seems wrong" }
  validates :experience, presence: true, numericality:  { message: "has to be in number of years" }
end
