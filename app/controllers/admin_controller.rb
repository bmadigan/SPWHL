class AdminController < ApplicationController
  def index
    @team = Team.find_by_manager_id(current_user)
    @schedule = TeamSchedule.find_all_by_team_id(@team)
  end

end
