class CreateAttemptAnswers < ActiveRecord::Migration
  def change
    create_table :attempt_answers do |t|
      t.references :answer, index: true
      t.references :attempt_question, index: true
      t.boolean :choosen, default: true

      t.timestamps null: false
    end
    add_foreign_key :attempt_answers, :answers
    add_foreign_key :attempt_answers, :attempt_questions
  end
end
