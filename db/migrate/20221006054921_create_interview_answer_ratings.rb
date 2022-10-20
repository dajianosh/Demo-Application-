class CreateInterviewAnswerRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :interview_answer_ratings do |t|
      t.string :answer
      t.integer :rating
      t.references :interview_feedback, null: false, foreign_key: true
      t.references :question_bank, null: false, foreign_key: true

      t.timestamps
    end
  end
end
