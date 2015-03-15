class AddImageToInstitute < ActiveRecord::Migration
  def change
    add_column :institutes, :image, :string
  end
end
