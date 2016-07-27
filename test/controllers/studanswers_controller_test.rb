require 'test_helper'

class StudanswersControllerTest < ActionController::TestCase
  setup do
    @studanswer = studanswers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:studanswers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create studanswer" do
    assert_difference('Studanswer.count') do
      post :create, studanswer: { StudentAnswer: @studanswer.StudentAnswer, StudentAnswer: @studanswer.StudentAnswer }
    end

    assert_redirected_to studanswer_path(assigns(:studanswer))
  end

  test "should show studanswer" do
    get :show, id: @studanswer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @studanswer
    assert_response :success
  end

  test "should update studanswer" do
    patch :update, id: @studanswer, studanswer: { StudentAnswer: @studanswer.StudentAnswer, StudentAnswer: @studanswer.StudentAnswer }
    assert_redirected_to studanswer_path(assigns(:studanswer))
  end

  test "should destroy studanswer" do
    assert_difference('Studanswer.count', -1) do
      delete :destroy, id: @studanswer
    end

    assert_redirected_to studanswers_path
  end
end
