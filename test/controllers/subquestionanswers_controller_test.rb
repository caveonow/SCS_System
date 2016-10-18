require 'test_helper'

class SubquestionanswersControllerTest < ActionController::TestCase
  setup do
    @subquestionanswer = subquestionanswers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subquestionanswers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subquestionanswer" do
    assert_difference('Subquestionanswer.count') do
      post :create, subquestionanswer: { SQAnswer: @subquestionanswer.SQAnswer, SQAnswerCount: @subquestionanswer.SQAnswerCount, subquestion_id: @subquestionanswer.subquestion_id }
    end

    assert_redirected_to subquestionanswer_path(assigns(:subquestionanswer))
  end

  test "should show subquestionanswer" do
    get :show, id: @subquestionanswer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subquestionanswer
    assert_response :success
  end

  test "should update subquestionanswer" do
    patch :update, id: @subquestionanswer, subquestionanswer: { SQAnswer: @subquestionanswer.SQAnswer, SQAnswerCount: @subquestionanswer.SQAnswerCount, subquestion_id: @subquestionanswer.subquestion_id }
    assert_redirected_to subquestionanswer_path(assigns(:subquestionanswer))
  end

  test "should destroy subquestionanswer" do
    assert_difference('Subquestionanswer.count', -1) do
      delete :destroy, id: @subquestionanswer
    end

    assert_redirected_to subquestionanswers_path
  end
end
