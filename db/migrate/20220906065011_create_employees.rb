class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.string :email, null: false
      t.string :password_digest
      t.string :name
      t.string :role
      t.string :address
      t.integer :contact_number
      t.integer :experience

      t.timestamps
    end
  end
end
