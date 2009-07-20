require 'test_helper'

class AlternateTitlesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:alternate_titles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create alternate_title" do
    assert_difference('AlternateTitle.count') do
      post :create, :alternate_title => { }
    end

    assert_redirected_to alternate_title_path(assigns(:alternate_title))
  end

  test "should show alternate_title" do
    get :show, :id => alternate_titles(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => alternate_titles(:one).id
    assert_response :success
  end

  test "should update alternate_title" do
    put :update, :id => alternate_titles(:one).id, :alternate_title => { }
    assert_redirected_to alternate_title_path(assigns(:alternate_title))
  end

  test "should destroy alternate_title" do
    assert_difference('AlternateTitle.count', -1) do
      delete :destroy, :id => alternate_titles(:one).id
    end

    assert_redirected_to alternate_titles_path
  end
end
