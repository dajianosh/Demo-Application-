class Interview < ApplicationRecord
  belongs_to :employee
  belongs_to :creator, class_name: "Employee"
  belongs_to :candidate
  enum mode: { Offline: 0, Online: 1 }

  attr_accessor :date, :start_time
  validates :date, :start_time, presence: :true, if: :is_date?

  before_save :convert_to_datetime, if: :is_date?
  
  def convert_to_datetime
    self.scheduled_at = DateTime.parse("#{date} #{start_time}")
  end

  def is_date?
    date || start_time
  end
end
