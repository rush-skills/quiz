class Test < ActiveRecord::Base
  has_many :questions
  belongs_to :category
  belongs_to :user
end
