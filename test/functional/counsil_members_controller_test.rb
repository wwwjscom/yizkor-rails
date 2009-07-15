require 'test_helper'

class CounsilMembersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:counsil_members)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create counsil_member" do
    assert_difference('CounsilMember.count') do
      post :create, :counsil_member => { }
    end

    assert_redirected_to counsil_member_path(assigns(:counsil_member))
  end

  test "should show counsil_member" do
    get :show, :id => counsil_members(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => counsil_members(:one).id
    assert_response :success
  end

  test "should update counsil_member" do
    put :update, :id => counsil_members(:one).id, :counsil_member => { }
    assert_redirected_to counsil_member_path(assigns(:counsil_member))
  end

  test "should destroy counsil_member" do
    assert_difference('CounsilMember.count', -1) do
      delete :destroy, :id => counsil_members(:one).id
    end

    assert_redirected_to counsil_members_path
  end
end
