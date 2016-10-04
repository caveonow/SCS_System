require 'test_helper'

class BannerslidesControllerTest < ActionController::TestCase
  setup do
    @bannerslide = bannerslides(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bannerslides)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bannerslide" do
    assert_difference('Bannerslide.count') do
      post :create, bannerslide: { imageBs: @bannerslide.imageBs, name: @bannerslide.name }
    end

    assert_redirected_to bannerslide_path(assigns(:bannerslide))
  end

  test "should show bannerslide" do
    get :show, id: @bannerslide
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bannerslide
    assert_response :success
  end

  test "should update bannerslide" do
    patch :update, id: @bannerslide, bannerslide: { imageBs: @bannerslide.imageBs, name: @bannerslide.name }
    assert_redirected_to bannerslide_path(assigns(:bannerslide))
  end

  test "should destroy bannerslide" do
    assert_difference('Bannerslide.count', -1) do
      delete :destroy, id: @bannerslide
    end

    assert_redirected_to bannerslides_path
  end
end
