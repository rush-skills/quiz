class QuestionsController < ApplicationController
  before_action :set_test
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized


  # GET /questions/1
  # GET /questions/1.json
  def show
    authorize @question
  end

  # GET /questions/new
  def new
    @question = Question.new
    authorize @question
  end

  # GET /questions/1/edit
  def edit
    authorize @question
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)
    @question.test_id = @test.id
    authorize @question
    respond_to do |format|
      if @question.save
        format.html { redirect_to [@test], notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @test }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    
    @question.test_id = @test.id
    authorize @question
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to [@test], notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @test }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    authorize @question
    @question.destroy
    respond_to do |format|
      format.html { redirect_to test_questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = @test.questions.find(params[:id])
    end

    def set_test
      @test = Test.find(params[:test_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:title, :description, :test_id,:image,:remote_image_url, answers_attributes: [:id, :text, :correct,:image,:remote_image_url, :_destroy])
    end
end
