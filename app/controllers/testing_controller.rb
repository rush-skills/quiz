class TestingController < ApplicationController
	def index
		@tests = Test.all
	end
	def take

    @test = Test.find(params[:id])
    @test_attempt = TestAttempt.where(user_id: current_user.id, test_id: @test.id).first
    if @test_attempt.nil?
	    @test_attempt = TestAttempt.create!(user_id: current_user.id, test_id: @test.id)
	    @questions = @test.questions
	    @attempt_questions = []
	    @attempt_answers =  Hash.new([])
	    @questions.each { |x| 
	    	ques = AttemptQuestion.create!(question: x,test_attempt: @test_attempt)
	    	@attempt_questions << ques
	    	answers = x.answers
	    	answers.each { |a|
	    		@attempt_answers[ques.id] += [AttemptAnswer.create!(attempt_question: ques,answer: a)]
	    	}
	    }
	  else
	  	@attempt_questions = @test_attempt.attempt_questions
	  	@attempt_answers =  Hash.new([])
	    @attempt_questions.each { |x| 
	    	answers = x.question.answers
	    	answers.each { |a|
	    		@attempt_answers[x.id] += [AttemptAnswer.where(attempt_question: x,answer: a).first]
	    	}
	    }
		end
  end
  def checked
  	@test_attempt = TestAttempt.find(params[:test_id])
  	@answer = AttemptAnswer.find(params[:id])
  	@answer.choosen = (not @answer.choosen)
  	if @answer.choosen.nil?
  		@answer.choosen = true
  	end
  	respond_to do |format|
      if @answer.save
        format.json { render json: "Success", status: :ok}
      else
        format.json { render json: "Not Success", status: :unprocessable_entity }
      end
    end
  end
end
