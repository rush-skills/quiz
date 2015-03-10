class AttemptQuestion < ActiveRecord::Base
  belongs_to :question
  belongs_to :test_attempt
  has_many :attemp_answer, :dependent => :destroy
  accepts_nested_attributes_for :attemp_answer, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true

end
