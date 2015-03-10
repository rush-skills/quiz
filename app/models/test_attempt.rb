class TestAttempt < ActiveRecord::Base
  belongs_to :user
  belongs_to :test
  has_many :attempt_questions, :dependent => :destroy
  accepts_nested_attributes_for :attempt_questions, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true

end
