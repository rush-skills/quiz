class CreateTestAttempts < ActiveRecord::Migration
  def change
    create_table :test_attempts do |t|
      t.references :user, index: true
      t.references :test, index: true
      t.string :marks
      t.time :time_taken

      t.timestamps null: false
    end
    add_foreign_key :test_attempts, :users
    add_foreign_key :test_attempts, :tests
  end
end
