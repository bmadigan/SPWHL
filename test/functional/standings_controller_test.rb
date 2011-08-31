require 'test_helper'

class StandingsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Standings.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Standings.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Standings.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to standings_url(assigns(:standings))
  end

  def test_edit
    get :edit, :id => Standings.first
    assert_template 'edit'
  end

  def test_update_invalid
    Standings.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Standings.first
    assert_template 'edit'
  end

  def test_update_valid
    Standings.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Standings.first
    assert_redirected_to standings_url(assigns(:standings))
  end

  def test_destroy
    standings = Standings.first
    delete :destroy, :id => standings
    assert_redirected_to standings_url
    assert !Standings.exists?(standings.id)
  end
end
