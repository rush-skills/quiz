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
  has_many :categories
end
