require 'test_helper'

class MediafilesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Mediafile.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Mediafile.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Mediafile.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to mediafile_url(assigns(:mediafile))
  end

  def test_edit
    get :edit, :id => Mediafile.first
    assert_template 'edit'
  end

  def test_update_invalid
    Mediafile.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Mediafile.first
    assert_template 'edit'
  end

  def test_update_valid
    Mediafile.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Mediafile.first
    assert_redirected_to mediafile_url(assigns(:mediafile))
  end

  def test_destroy
    mediafile = Mediafile.first
    delete :destroy, :id => mediafile
    assert_redirected_to mediafiles_url
    assert !Mediafile.exists?(mediafile.id)
  end
end
