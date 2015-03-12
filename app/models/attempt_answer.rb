# == Schema Information
#
# Table name: attempt_answers
#
#  id                  :integer          not null, primary key
#  answer_id           :integer
#  attempt_question_id :integer
#  choosen             :boolean
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class AttemptAnswer < ActiveRecord::Base
  belongs_to :answer
  belongs_to :attempt_question
end
