class CreateUserSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :user_skills do |t|
      t.bigint  :skillable_id
      t.string  :skillable_type
      t.references :skill, null: false, foreign_key: true

      t.timestamps
    end
  end
end
