# == Schema Information
#
# Table name: tests
#
#  id          :integer          not null, primary key
#  title       :string
#  free        :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#  user_id     :integer
#

class Test < ActiveRecord::Base
  has_many :questions
  validates :title, presence: true
  validates :category_id, presence: true
  
  belongs_to :category
  belongs_to :user
end
