class CreateInstitutePackages < ActiveRecord::Migration
  def change
    create_table :institute_packages do |t|
      t.references :institute, index: true
      t.references :package, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :institute_packages, :institutes
    add_foreign_key :institute_packages, :packages
    add_foreign_key :institute_packages, :users
  end
end
