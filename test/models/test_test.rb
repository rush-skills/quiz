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

require 'test_helper'

class TestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
