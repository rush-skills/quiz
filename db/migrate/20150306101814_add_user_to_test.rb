class AddUserToTest < ActiveRecord::Migration
  def change
    add_reference :tests, :user, index: true
    add_foreign_key :tests, :users
  end
end
