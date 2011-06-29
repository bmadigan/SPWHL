require 'test_helper'

class TeamSchedulesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => TeamSchedule.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    TeamSchedule.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    TeamSchedule.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to team_schedule_url(assigns(:team_schedule))
  end

  def test_edit
    get :edit, :id => TeamSchedule.first
    assert_template 'edit'
  end

  def test_update_invalid
    TeamSchedule.any_instance.stubs(:valid?).returns(false)
    put :update, :id => TeamSchedule.first
    assert_template 'edit'
  end

  def test_update_valid
    TeamSchedule.any_instance.stubs(:valid?).returns(true)
    put :update, :id => TeamSchedule.first
    assert_redirected_to team_schedule_url(assigns(:team_schedule))
  end

  def test_destroy
    team_schedule = TeamSchedule.first
    delete :destroy, :id => team_schedule
    assert_redirected_to team_schedules_url
    assert !TeamSchedule.exists?(team_schedule.id)
  end
end
