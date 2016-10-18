require 'test_helper'

class SubquestionsControllerTest < ActionController::TestCase
  setup do
    @subquestion = subquestions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subquestions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subquestion" do
    assert_difference('Subquestion.count') do
      post :create, subquestion: { SubquestionDesc: @subquestion.SubquestionDesc, question_id: @subquestion.question_id }
    end

    assert_redirected_to subquestion_path(assigns(:subquestion))
  end

  test "should show subquestion" do
    get :show, id: @subquestion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subquestion
    assert_response :success
  end

  test "should update subquestion" do
    patch :update, id: @subquestion, subquestion: { SubquestionDesc: @subquestion.SubquestionDesc, question_id: @subquestion.question_id }
    assert_redirected_to subquestion_path(assigns(:subquestion))
  end

  test "should destroy subquestion" do
    assert_difference('Subquestion.count', -1) do
      delete :destroy, id: @subquestion
    end

    assert_redirected_to subquestions_path
  end
end
