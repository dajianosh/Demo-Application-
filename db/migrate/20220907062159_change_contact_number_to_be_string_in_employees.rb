class ChangeContactNumberToBeStringInEmployees < ActiveRecord::Migration[6.0]
  def change
    change_column :employees, :contact_number, :string
  end
end
