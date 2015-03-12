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

require 'test_helper'

class AttemptAnswerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
