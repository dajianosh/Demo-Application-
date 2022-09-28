class ChangeDateAndTimeToDateTime < ActiveRecord::Migration[6.0]
  def change
    remove_column :interviews, :date, :date
    remove_column :interviews, :start_time, :string
    add_column :interviews, :scheduled_at, :datetime
  end
end
