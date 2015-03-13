class CreateAttemptQuestions < ActiveRecord::Migration
  def change
    create_table :attempt_questions do |t|
      t.references :question, index: true
      t.references :test_attempt, index: true
      t.boolean :correct, default: false

      t.timestamps null: false
    end
    add_foreign_key :attempt_questions, :questions
    add_foreign_key :attempt_questions, :test_attempts
  end
end
