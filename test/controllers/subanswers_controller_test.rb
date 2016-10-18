require 'test_helper'

class SubanswersControllerTest < ActionController::TestCase
  setup do
    @subanswer = subanswers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subanswers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subanswer" do
    assert_difference('Subanswer.count') do
      post :create, subanswer: { SubAnswerCount: @subanswer.SubAnswerCount, SubAnswerDesc: @subanswer.SubAnswerDesc, answer_id: @subanswer.answer_id }
    end

    assert_redirected_to subanswer_path(assigns(:subanswer))
  end

  test "should show subanswer" do
    get :show, id: @subanswer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subanswer
    assert_response :success
  end

  test "should update subanswer" do
    patch :update, id: @subanswer, subanswer: { SubAnswerCount: @subanswer.SubAnswerCount, SubAnswerDesc: @subanswer.SubAnswerDesc, answer_id: @subanswer.answer_id }
    assert_redirected_to subanswer_path(assigns(:subanswer))
  end

  test "should destroy subanswer" do
    assert_difference('Subanswer.count', -1) do
      delete :destroy, id: @subanswer
    end

    assert_redirected_to subanswers_path
  end
end
