require 'test_helper'

class DigitizedLinksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:digitized_links)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create digitized_link" do
    assert_difference('DigitizedLink.count') do
      post :create, :digitized_link => { }
    end

    assert_redirected_to digitized_link_path(assigns(:digitized_link))
  end

  test "should show digitized_link" do
    get :show, :id => digitized_links(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => digitized_links(:one).id
    assert_response :success
  end

  test "should update digitized_link" do
    put :update, :id => digitized_links(:one).id, :digitized_link => { }
    assert_redirected_to digitized_link_path(assigns(:digitized_link))
  end

  test "should destroy digitized_link" do
    assert_difference('DigitizedLink.count', -1) do
      delete :destroy, :id => digitized_links(:one).id
    end

    assert_redirected_to digitized_links_path
  end
end
