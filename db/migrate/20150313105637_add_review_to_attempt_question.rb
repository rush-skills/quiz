class AddReviewToAttemptQuestion < ActiveRecord::Migration
  def change
    add_column :attempt_questions, :review, :boolean, default: false
  end
end
