class RemovePasswordDigestFromEmployees < ActiveRecord::Migration[6.0]
  def change
    remove_column :employees, :password_digest, :string
  end
end
