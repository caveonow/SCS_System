require 'test_helper'

class YearofstudiesControllerTest < ActionController::TestCase
  setup do
    @yearofstudy = yearofstudies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:yearofstudies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create yearofstudy" do
    assert_difference('Yearofstudy.count') do
      post :create, yearofstudy: { yearDetails: @yearofstudy.yearDetails }
    end

    assert_redirected_to yearofstudy_path(assigns(:yearofstudy))
  end

  test "should show yearofstudy" do
    get :show, id: @yearofstudy
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @yearofstudy
    assert_response :success
  end

  test "should update yearofstudy" do
    patch :update, id: @yearofstudy, yearofstudy: { yearDetails: @yearofstudy.yearDetails }
    assert_redirected_to yearofstudy_path(assigns(:yearofstudy))
  end

  test "should destroy yearofstudy" do
    assert_difference('Yearofstudy.count', -1) do
      delete :destroy, id: @yearofstudy
    end

    assert_redirected_to yearofstudies_path
  end
end
