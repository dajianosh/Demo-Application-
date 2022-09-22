class Candidate < ApplicationRecord

  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'is invalid' }
  validates :name, :address, presence: true
  validates :contact_number, presence: true, numericality: { message: "%{value} seems wrong" }
  validates :experience, presence: true, numericality: { greater_than_or_equal_to: 0 }

end
