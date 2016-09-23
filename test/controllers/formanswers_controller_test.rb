require 'test_helper'

class FormanswersControllerTest < ActionController::TestCase
  setup do
    @formanswer = formanswers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:formanswers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create formanswer" do
    assert_difference('Formanswer.count') do
      post :create, formanswer: { FormAnswer: @formanswer.FormAnswer, StudAnswerDateTime: @formanswer.StudAnswerDateTime, form_id: @formanswer.form_id, user_id: @formanswer.user_id }
    end

    assert_redirected_to formanswer_path(assigns(:formanswer))
  end

  test "should show formanswer" do
    get :show, id: @formanswer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @formanswer
    assert_response :success
  end

  test "should update formanswer" do
    patch :update, id: @formanswer, formanswer: { FormAnswer: @formanswer.FormAnswer, StudAnswerDateTime: @formanswer.StudAnswerDateTime, form_id: @formanswer.form_id, user_id: @formanswer.user_id }
    assert_redirected_to formanswer_path(assigns(:formanswer))
  end

  test "should destroy formanswer" do
    assert_difference('Formanswer.count', -1) do
      delete :destroy, id: @formanswer
    end

    assert_redirected_to formanswers_path
  end
end
