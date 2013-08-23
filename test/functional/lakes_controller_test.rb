require 'test_helper'

class LakesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:lakes)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_lake
    assert_difference('Lake.count') do
      post :create, :lake => { }
    end

    assert_redirected_to lake_path(assigns(:lake))
  end

  def test_should_show_lake
    get :show, :id => lakes(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => lakes(:one).id
    assert_response :success
  end

  def test_should_update_lake
    put :update, :id => lakes(:one).id, :lake => { }
    assert_redirected_to lake_path(assigns(:lake))
  end

  def test_should_destroy_lake
    assert_difference('Lake.count', -1) do
      delete :destroy, :id => lakes(:one).id
    end

    assert_redirected_to lakes_path
  end
end
