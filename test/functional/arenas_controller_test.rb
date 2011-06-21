require 'test_helper'

class ArenasControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Arena.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Arena.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Arena.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to arena_url(assigns(:arena))
  end

  def test_edit
    get :edit, :id => Arena.first
    assert_template 'edit'
  end

  def test_update_invalid
    Arena.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Arena.first
    assert_template 'edit'
  end

  def test_update_valid
    Arena.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Arena.first
    assert_redirected_to arena_url(assigns(:arena))
  end

  def test_destroy
    arena = Arena.first
    delete :destroy, :id => arena
    assert_redirected_to arenas_url
    assert !Arena.exists?(arena.id)
  end
end
