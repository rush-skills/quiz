class Test < ActiveRecord::Base
  has_many :questions
  has_one :category
  belongs_to :user
end
