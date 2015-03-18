# == Schema Information
#
# Table name: institutes
#
#  id         :integer          not null, primary key
#  name       :string
#  details    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  image      :string
#

class Institute < ActiveRecord::Base
  validates :name, :presence => {:message => ' cannot be blank, not saved'}
  has_many :users
  has_many :institute_package
  has_many :packages, through: :institute_package
  mount_uploader :image, ImageUploader
  def to_s
  	self.name
  end
  def allowed_tests
  	self.packages.collect {|a| a.tests }.flatten
  end
end
