class CreateInterviewFeedbacks < ActiveRecord::Migration[6.0]
  def change
    create_table :interview_feedbacks do |t|
      t.integer :skill_rating
      t.integer :soft_skill_rating
      t.integer :final_rating
      t.references :interview, null: false, foreign_key: true

      t.timestamps
    end
  end
end
