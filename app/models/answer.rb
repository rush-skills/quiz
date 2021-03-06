# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  text        :string
#  correct     :boolean          default("f")
#  question_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  image       :string
#

class Answer < ActiveRecord::Base
  belongs_to :question
  has_many :attempt_answers
  mount_uploader :image, ImageUploader
  def user
    self.question.test.user
  end
end
