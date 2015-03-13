class AddCompletedToTestAttempt < ActiveRecord::Migration
  def change
    add_column :test_attempts, :completed, :boolean, :default => false
  end
end
