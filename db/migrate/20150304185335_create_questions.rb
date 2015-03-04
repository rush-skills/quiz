class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :description
      t.references :test, index: true

      t.timestamps null: false
    end
    add_foreign_key :questions, :tests
  end
end
