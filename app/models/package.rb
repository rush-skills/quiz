# == Schema Information
#
# Table name: packages
#
#  id         :integer          not null, primary key
#  name       :string
#  image      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Package < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  has_many :institute_package
  has_many :categories
  has_many :institutes, through: :institute_package

  def tests
  	self.categories.collect {|a| a.tests }.flatten
  end
  def to_s
  	self.name
  end
end
