class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :title
      t.boolean :free

      t.timestamps null: false
    end
  end
end
