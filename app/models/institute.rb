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
  mount_uploader :image, ImageUploader
end
