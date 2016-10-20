require 'test_helper'

class LevelofstudiesControllerTest < ActionController::TestCase
  setup do
    @levelofstudy = levelofstudies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:levelofstudies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create levelofstudy" do
    assert_difference('Levelofstudy.count') do
      post :create, levelofstudy: { levelname: @levelofstudy.levelname }
    end

    assert_redirected_to levelofstudy_path(assigns(:levelofstudy))
  end

  test "should show levelofstudy" do
    get :show, id: @levelofstudy
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @levelofstudy
    assert_response :success
  end

  test "should update levelofstudy" do
    patch :update, id: @levelofstudy, levelofstudy: { levelname: @levelofstudy.levelname }
    assert_redirected_to levelofstudy_path(assigns(:levelofstudy))
  end

  test "should destroy levelofstudy" do
    assert_difference('Levelofstudy.count', -1) do
      delete :destroy, id: @levelofstudy
    end

    assert_redirected_to levelofstudies_path
  end
end
