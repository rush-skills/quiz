# == Schema Information
#
# Table name: attempt_questions
#
#  id              :integer          not null, primary key
#  question_id     :integer
#  test_attempt_id :integer
#  correct         :boolean          default("f")
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  review          :boolean          default("f")
#

class AttemptQuestion < ActiveRecord::Base
  belongs_to :question
  belongs_to :test_attempt
  has_many :attempt_answers, :dependent => :destroy
  accepts_nested_attributes_for :attempt_answers, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true

end
