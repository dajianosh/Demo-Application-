class CreateCandidates < ActiveRecord::Migration[6.0]
  def change
    create_table :candidates do |t|
      t.string :email, null: false
      t.string :name
      t.string :address
      t.integer :contact_number
      t.integer :experience
      t.timestamps
    end
  end
end
