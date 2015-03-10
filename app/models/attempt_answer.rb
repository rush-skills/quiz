class AttemptAnswer < ActiveRecord::Base
  belongs_to :answer
  belongs_to :attempt_question
end
