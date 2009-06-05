require 'test_helper'

class CallNumsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:call_nums)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create call_num" do
    assert_difference('CallNum.count') do
      post :create, :call_num => { }
    end

    assert_redirected_to call_num_path(assigns(:call_num))
  end

  test "should show call_num" do
    get :show, :id => call_nums(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => call_nums(:one).id
    assert_response :success
  end

  test "should update call_num" do
    put :update, :id => call_nums(:one).id, :call_num => { }
    assert_redirected_to call_num_path(assigns(:call_num))
  end

  test "should destroy call_num" do
    assert_difference('CallNum.count', -1) do
      delete :destroy, :id => call_nums(:one).id
    end

    assert_redirected_to call_nums_path
  end
end
