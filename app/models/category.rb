# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  package_id :integer
#

class Category < ActiveRecord::Base
  validates :title, :presence => {:message => 'Category cannot be blank, not saved'}
  has_many :tests
  belongs_to :package
end
