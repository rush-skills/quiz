class TestsController < ApplicationController
  before_action :set_test, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized
  
  # GET /tests
  # GET /tests.json
  def index
    if current_user.prof?
      @tests = current_user.tests
    end
    @tests ||= Test.all
    authorize Test
    
  end

  # GET /tests/1
  # GET /tests/1.json
  def show
    authorize @test
  end

  # GET /tests/new
  def new
    @test = Test.new
    @categories = Category.all
    authorize @test
  end

  # GET /tests/1/edit
  def edit
    authorize @test
    @categories = Category.all
  end

  # POST /tests
  # POST /tests.json
  def create
    @test = Test.new(test_params)
    @test.user = current_user
    authorize @test
    respond_to do |format|
      if @test.save
        format.html { redirect_to @test, notice: 'Test was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /tests/1
  # PATCH/PUT /tests/1.json
  def update
    authorize @test
    respond_to do |format|
      if @test.update(test_params)
        format.html { redirect_to @test, notice: 'Test was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /tests/1
  # DELETE /tests/1.json
  def destroy
    authorize @test
    @test.destroy
    respond_to do |format|
      format.html { redirect_to tests_url, notice: 'Test was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test
      @test = Test.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_params
      params.require(:test).permit(:title, :free, :category_id)
    end
end
