class InstitutesController < ApplicationController
  before_action :set_institute, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized
  
  def add_user_to_institute
    user = User.find(params[:uid])
    @institute = Institute.find(params[:iid])
    authorize @institute
    user.institute = @institute
    user.role = 1
    user.save!
    redirect_to @institute
  end

  def add_admin_to_institute
    user = User.find(params[:uid])
    @institute = Institute.find(params[:iid])
    authorize @institute
    user.institute = @institute
    user.role = 1
    user.save!
    redirect_to @institute
  end

  def add_user_to_current_institute
    user = User.find(params[:uid])
    @institute = current_user.institute
    authorize @institute
    user.institute = @institute
    user.role = 1
    user.save!
    redirect_to @institute
  end

  # GET /institutes
  # GET /institutes.json
  def index
    @institutes = Institute.all
    authorize Institute
  end

  # GET /institutes/1
  # GET /institutes/1.json
  def show
    authorize @institute
    @admins = User.where(role:3,institute_id: @institute.id)
    @students = User.where(role:1,institute_id: @institute.id)
  end

  # GET /institutes/new
  def new
    @institute = Institute.new
    authorize @institute
  end

  # GET /institutes/1/edit
  def edit
    authorize @institute
  end

  # POST /institutes
  # POST /institutes.json
  def create
    @institute = Institute.new(institute_params)
    authorize @institute
    respond_to do |format|
      if @institute.save
        format.html { redirect_to @institute, notice: 'Institute was successfully created.' }
        format.json { render :show, status: :created, location: @institute }
      else
        format.html { render :new }
        format.json { render json: @institute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /institutes/1
  # PATCH/PUT /institutes/1.json
  def update
    authorize @institute
    respond_to do |format|
      if @institute.update(institute_params)
        format.html { redirect_to @institute, notice: 'Institute was successfully updated.' }
        format.json { render :show, status: :ok, location: @institute }
      else
        format.html { render :edit }
        format.json { render json: @institute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /institutes/1
  # DELETE /institutes/1.json
  def destroy
    authorize @institute
    @institute.destroy
    respond_to do |format|
      format.html { redirect_to institutes_url, notice: 'Institute was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_institute
      @institute = Institute.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def institute_params
      params.require(:institute).permit(:name, :details, :image)
    end
end
