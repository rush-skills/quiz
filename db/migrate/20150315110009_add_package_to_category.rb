class AddPackageToCategory < ActiveRecord::Migration
  def change
    add_reference :categories, :package, index: true
    add_foreign_key :categories, :packages
  end
end
