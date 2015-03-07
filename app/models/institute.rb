# == Schema Information
#
# Table name: institutes
#
#  id         :integer          not null, primary key
#  name       :string
#  details    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Institute < ActiveRecord::Base
  validates :name, :presence => {:message => 'Institute name cannot be blank, not saved'}
  has_many :users
end
