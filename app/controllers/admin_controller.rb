class AdminController < ApplicationController
  def index
    if current_user.manager?
      @team = Team.find_by_manager_id(current_user)
      @schedule = TeamSchedule.find_all_by_team_id(@team)
    end
    
    if current_user.director?
      @league = League.find_by_director_id(current_user)
    end
  end

end
