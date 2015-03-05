class AddCategoryToTests < ActiveRecord::Migration
  def change
    add_reference :tests, :category, index: true
    add_foreign_key :tests, :categories
  end
end
