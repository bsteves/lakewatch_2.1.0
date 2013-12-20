require 'test_helper'

class SecchiDataControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => SecchiDatum.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    SecchiDatum.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    SecchiDatum.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to secchi_datum_url(assigns(:secchi_datum))
  end

  def test_edit
    get :edit, :id => SecchiDatum.first
    assert_template 'edit'
  end

  def test_update_invalid
    SecchiDatum.any_instance.stubs(:valid?).returns(false)
    put :update, :id => SecchiDatum.first
    assert_template 'edit'
  end

  def test_update_valid
    SecchiDatum.any_instance.stubs(:valid?).returns(true)
    put :update, :id => SecchiDatum.first
    assert_redirected_to secchi_datum_url(assigns(:secchi_datum))
  end

  def test_destroy
    secchi_datum = SecchiDatum.first
    delete :destroy, :id => secchi_datum
    assert_redirected_to secchi_data_url
    assert !SecchiDatum.exists?(secchi_datum.id)
  end
end
