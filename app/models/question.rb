# == Schema Information
#
# Table name: questions
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  test_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  image       :string
#

class Question < ActiveRecord::Base
  belongs_to :test
  has_many :answers
  validates :title, :presence => true
  validates :test_id, :presence => true
  has_many :attempt_questions
  mount_uploader :image, ImageUploader
  accepts_nested_attributes_for :answers, :reject_if =>  proc { |a| a[:text].blank? }, :allow_destroy => true
  def user
    self.test.user
  end
end
