class CreateQuestionBanks < ActiveRecord::Migration[6.0]
  def change
    create_table :question_banks do |t|
      t.string :question
      t.string :difficulty_level
      t.string :tech
      t.timestamps
    end
  end
end
