class Question < ActiveRecord::Base
  belongs_to :test
  has_many :answers
  accepts_nested_attributes_for :answers, :reject_if => :all_blank, :allow_destroy => true
end
