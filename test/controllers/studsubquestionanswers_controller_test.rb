require 'test_helper'

class StudsubquestionanswersControllerTest < ActionController::TestCase
  setup do
    @studsubquestionanswer = studsubquestionanswers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:studsubquestionanswers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create studsubquestionanswer" do
    assert_difference('Studsubquestionanswer.count') do
      post :create, studsubquestionanswer: { formanswer_id: @studsubquestionanswer.formanswer_id, subquestionanswer_id: @studsubquestionanswer.subquestionanswer_id }
    end

    assert_redirected_to studsubquestionanswer_path(assigns(:studsubquestionanswer))
  end

  test "should show studsubquestionanswer" do
    get :show, id: @studsubquestionanswer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @studsubquestionanswer
    assert_response :success
  end

  test "should update studsubquestionanswer" do
    patch :update, id: @studsubquestionanswer, studsubquestionanswer: { formanswer_id: @studsubquestionanswer.formanswer_id, subquestionanswer_id: @studsubquestionanswer.subquestionanswer_id }
    assert_redirected_to studsubquestionanswer_path(assigns(:studsubquestionanswer))
  end

  test "should destroy studsubquestionanswer" do
    assert_difference('Studsubquestionanswer.count', -1) do
      delete :destroy, id: @studsubquestionanswer
    end

    assert_redirected_to studsubquestionanswers_path
  end
end
