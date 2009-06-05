require 'test_helper'

class ContributorsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contributors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contributor" do
    assert_difference('Contributor.count') do
      post :create, :contributor => { }
    end

    assert_redirected_to contributor_path(assigns(:contributor))
  end

  test "should show contributor" do
    get :show, :id => contributors(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => contributors(:one).id
    assert_response :success
  end

  test "should update contributor" do
    put :update, :id => contributors(:one).id, :contributor => { }
    assert_redirected_to contributor_path(assigns(:contributor))
  end

  test "should destroy contributor" do
    assert_difference('Contributor.count', -1) do
      delete :destroy, :id => contributors(:one).id
    end

    assert_redirected_to contributors_path
  end
end
