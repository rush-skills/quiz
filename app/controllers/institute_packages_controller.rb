class InstitutePackagesController < ApplicationController
  before_action :set_institute_package, only: [:show, :edit, :update, :destroy]
  before_action :ensure_admin
  
  # GET /institute_packages
  def index
    @institute_packages = InstitutePackage.all
  end

  # GET /institute_packages/new
  def new
    @institute_package = InstitutePackage.new
    @institutes = Institute.all
    @packages = Package.all
  end

  # GET /institute_packages/1/edit
  def edit

    @institutes = Institute.all
    @packages = Package.all
  end

  # POST /institute_packages
  def create
    @institute_package = InstitutePackage.new(institute_package_params)
    @institute_package.user= current_user
    respond_to do |format|
      if @institute_package.save
        format.html { redirect_to institute_packages_url, notice: 'Institute package was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /institute_packages/1
  def update

    @institute_package.user= current_user
    respond_to do |format|
      if @institute_package.update(institute_package_params)
        format.html { redirect_to institute_packages_url, notice: 'Institute package was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /institute_packages/1
  def destroy
    @institute_package.destroy
    respond_to do |format|
      format.html { redirect_to institute_packages_url, notice: 'Institute package was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_institute_package
      @institute_package = InstitutePackage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def institute_package_params
      params.require(:institute_package).permit(:institute_id, :package_id)
    end

    def ensure_admin
      redirect_to "/" unless current_user.admin?
    end
end
