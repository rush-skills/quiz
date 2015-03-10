require 'test_helper'

class TestAttemptsControllerTest < ActionController::TestCase
  setup do
    @test_attempt = test_attempts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:test_attempts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create test_attempt" do
    assert_difference('TestAttempt.count') do
      post :create, test_attempt: { marks: @test_attempt.marks, test_id: @test_attempt.test_id, time_taken: @test_attempt.time_taken, user_id: @test_attempt.user_id }
    end

    assert_redirected_to test_attempt_path(assigns(:test_attempt))
  end

  test "should show test_attempt" do
    get :show, id: @test_attempt
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @test_attempt
    assert_response :success
  end

  test "should update test_attempt" do
    patch :update, id: @test_attempt, test_attempt: { marks: @test_attempt.marks, test_id: @test_attempt.test_id, time_taken: @test_attempt.time_taken, user_id: @test_attempt.user_id }
    assert_redirected_to test_attempt_path(assigns(:test_attempt))
  end

  test "should destroy test_attempt" do
    assert_difference('TestAttempt.count', -1) do
      delete :destroy, id: @test_attempt
    end

    assert_redirected_to test_attempts_path
  end
end
