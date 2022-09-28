class CreateInterviews < ActiveRecord::Migration[6.0]
  def change
    create_table :interviews do |t|
      t.date :date
      t.string :time
      t.integer :mode
      t.string :link
      t.references :employee, null: false, foreign_key: true
      t.references :creator, null: false, foreign_key: { to_table: 'employees' }
      t.references :candidate, null: false, foreign_key: true
      t.timestamps
    end
  end
end
