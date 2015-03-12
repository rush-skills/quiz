# == Schema Information
#
# Table name: attempt_questions
#
#  id              :integer          not null, primary key
#  question_id     :integer
#  test_attempt_id :integer
#  mark            :decimal(, )
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class AttemptQuestion < ActiveRecord::Base
  belongs_to :question
  belongs_to :test_attempt
  has_many :attempt_answer, :dependent => :destroy
  accepts_nested_attributes_for :attempt_answer, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true

end
