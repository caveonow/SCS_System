require 'test_helper'

class FormassociatesControllerTest < ActionController::TestCase
  setup do
    @formassociate = formassociates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:formassociates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create formassociate" do
    assert_difference('Formassociate.count') do
      post :create, formassociate: { agecondition: @formassociate.agecondition, agefrom: @formassociate.agefrom, ageto: @formassociate.ageto, faculty_id: @formassociate.faculty_id, form_id: @formassociate.form_id, levelofstudy_id: @formassociate.levelofstudy_id, programme_id: @formassociate.programme_id, yearofstudy_id: @formassociate.yearofstudy_id }
    end

    assert_redirected_to formassociate_path(assigns(:formassociate))
  end

  test "should show formassociate" do
    get :show, id: @formassociate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @formassociate
    assert_response :success
  end

  test "should update formassociate" do
    patch :update, id: @formassociate, formassociate: { agecondition: @formassociate.agecondition, agefrom: @formassociate.agefrom, ageto: @formassociate.ageto, faculty_id: @formassociate.faculty_id, form_id: @formassociate.form_id, levelofstudy_id: @formassociate.levelofstudy_id, programme_id: @formassociate.programme_id, yearofstudy_id: @formassociate.yearofstudy_id }
    assert_redirected_to formassociate_path(assigns(:formassociate))
  end

  test "should destroy formassociate" do
    assert_difference('Formassociate.count', -1) do
      delete :destroy, id: @formassociate
    end

    assert_redirected_to formassociates_path
  end
end
