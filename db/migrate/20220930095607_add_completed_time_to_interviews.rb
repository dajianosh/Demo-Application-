class AddCompletedTimeToInterviews < ActiveRecord::Migration[6.0]
  def change
    add_column :interviews, :completed_time, :string
    rename_column :interviews, :time, :start_time
  end
end
