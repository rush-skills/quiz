class AddInstituteToUser < ActiveRecord::Migration
  def change
    add_reference :users, :institute, index: true
    add_foreign_key :users, :institutes
  end
end
