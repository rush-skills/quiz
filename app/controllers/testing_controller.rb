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
	  	unless @test_attempt.completed
		  	@attempt_questions = @test_attempt.attempt_questions
		  	@attempt_answers =  Hash.new([])
		    @attempt_questions.each { |x| 
		    	answers = x.question.answers
		    	answers.each { |a|
		    		@attempt_answers[x.id] += [AttemptAnswer.where(attempt_question: x,answer: a).first]
		    	}
		    }
		  else
		  	redirect_to test_result_path @test_attempt
		  end
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
  def review
  	@test_attempt = TestAttempt.find(params[:test_id])
  	@question = AttemptQuestion.find(params[:id])
  	@question.review = (not @question.review)
  	if @question.review.nil?
  		@question.review = true
  	end
  	respond_to do |format|
      if @question.save
        format.json { render json: "Success", status: :ok}
      else
        format.json { render json: "Not Success", status: :unprocessable_entity }
      end
    end
  end
  def submit
  	@test_attempt = TestAttempt.find(params[:id])
  	@test_attempt.completed = true
  	@test_attempt.save!
  	calculate_marks @test_attempt
  	redirect_to test_result_path(@test_attempt)
  end
  def result
  	@test_attempt = TestAttempt.find(params[:id])
  	@questions = @test_attempt.attempt_questions
  	@correct = @questions.where(correct: true)
  	@correct = @test_attempt.marks
  end

  def calculate_marks test_attempt
  	questions = test_attempt.attempt_questions
  	total = 0
  	questions.each do |ques|
  		answers = ques.attempt_answers
  		correct = true
  		answers.each do |ans|
  			unless ans.choosen == ans.answer.correct
  				correct = false
  			end
  		end
  		if correct
  			ques.correct = true
  			total +=1
  		else
  			ques.correct = false
  		end
  		ques.save!
  	end
  	test_attempt.marks = total.to_s
  	test_attempt.save!
  end
end
