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

require 'test_helper'

class AttemptQuestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
