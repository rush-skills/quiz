require 'test_helper'

class InstitutePackagesControllerTest < ActionController::TestCase
  setup do
    @institute_package = institute_packages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:institute_packages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create institute_package" do
    assert_difference('InstitutePackage.count') do
      post :create, institute_package: { institute_id: @institute_package.institute_id, package_id: @institute_package.package_id, user_id: @institute_package.user_id }
    end

    assert_redirected_to institute_package_path(assigns(:institute_package))
  end

  test "should show institute_package" do
    get :show, id: @institute_package
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @institute_package
    assert_response :success
  end

  test "should update institute_package" do
    patch :update, id: @institute_package, institute_package: { institute_id: @institute_package.institute_id, package_id: @institute_package.package_id, user_id: @institute_package.user_id }
    assert_redirected_to institute_package_path(assigns(:institute_package))
  end

  test "should destroy institute_package" do
    assert_difference('InstitutePackage.count', -1) do
      delete :destroy, id: @institute_package
    end

    assert_redirected_to institute_packages_path
  end
end
