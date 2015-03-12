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

require 'test_helper'

class AttemptQuestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
