require 'test_helper'

class StudsubanswersControllerTest < ActionController::TestCase
  setup do
    @studsubanswer = studsubanswers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:studsubanswers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create studsubanswer" do
    assert_difference('Studsubanswer.count') do
      post :create, studsubanswer: { formanswer_id: @studsubanswer.formanswer_id, subanswer_id: @studsubanswer.subanswer_id }
    end

    assert_redirected_to studsubanswer_path(assigns(:studsubanswer))
  end

  test "should show studsubanswer" do
    get :show, id: @studsubanswer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @studsubanswer
    assert_response :success
  end

  test "should update studsubanswer" do
    patch :update, id: @studsubanswer, studsubanswer: { formanswer_id: @studsubanswer.formanswer_id, subanswer_id: @studsubanswer.subanswer_id }
    assert_redirected_to studsubanswer_path(assigns(:studsubanswer))
  end

  test "should destroy studsubanswer" do
    assert_difference('Studsubanswer.count', -1) do
      delete :destroy, id: @studsubanswer
    end

    assert_redirected_to studsubanswers_path
  end
end
