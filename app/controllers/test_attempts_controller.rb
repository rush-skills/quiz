class TestAttemptsController < ApplicationController
  before_action :set_test_attempt, only: [:show, :edit, :update, :destroy]

  # GET /test_attempts
  # GET /test_attempts.json
  def index
    @test_attempts = TestAttempt.all
  end

  # GET /test_attempts/1
  # GET /test_attempts/1.json
  def show
  end

  # GET /test_attempts/new
  def new
    @test_attempt = TestAttempt.new
  end

  # GET /test_attempts/1/edit
  def edit
  end

  # POST /test_attempts
  # POST /test_attempts.json
  def create
    @test_attempt = TestAttempt.new(test_attempt_params)

    respond_to do |format|
      if @test_attempt.save
        format.html { redirect_to @test_attempt, notice: 'Test attempt was successfully created.' }
        format.json { render :show, status: :created, location: @test_attempt }
      else
        format.html { render :new }
        format.json { render json: @test_attempt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test_attempts/1
  # PATCH/PUT /test_attempts/1.json
  def update
    respond_to do |format|
      if @test_attempt.update(test_attempt_params)
        format.html { redirect_to @test_attempt, notice: 'Test attempt was successfully updated.' }
        format.json { render :show, status: :ok, location: @test_attempt }
      else
        format.html { render :edit }
        format.json { render json: @test_attempt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_attempts/1
  # DELETE /test_attempts/1.json
  def destroy
    @test_attempt.destroy
    respond_to do |format|
      format.html { redirect_to test_attempts_url, notice: 'Test attempt was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_attempt
      @test_attempt = TestAttempt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_attempt_params
      params.require(:test_attempt).permit(:user_id, :test_id, :marks, :time_taken)
    end
end
