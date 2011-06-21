require 'test_helper'

class RostersControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Roster.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Roster.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Roster.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to roster_url(assigns(:roster))
  end

  def test_edit
    get :edit, :id => Roster.first
    assert_template 'edit'
  end

  def test_update_invalid
    Roster.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Roster.first
    assert_template 'edit'
  end

  def test_update_valid
    Roster.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Roster.first
    assert_redirected_to roster_url(assigns(:roster))
  end

  def test_destroy
    roster = Roster.first
    delete :destroy, :id => roster
    assert_redirected_to rosters_url
    assert !Roster.exists?(roster.id)
  end
end
