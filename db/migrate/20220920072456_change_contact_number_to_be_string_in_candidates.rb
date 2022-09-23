class ChangeContactNumberToBeStringInCandidates < ActiveRecord::Migration[6.0]
  def change
    change_column :candidates, :contact_number, :string
  end
end
