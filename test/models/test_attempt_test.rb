# == Schema Information
#
# Table name: test_attempts
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  test_id    :integer
#  marks      :string
#  time_taken :time
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class TestAttemptTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
