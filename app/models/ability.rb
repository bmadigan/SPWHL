class Ability
  include CanCan::Ability

  def initialize(user)
    
    user ||= User.new # guest user (not logged in)
    
    alias_action :update, :edit, :to => :modify_team_info
    
    # LEAGUE DIRECTOR ABILITIES
    # =====================================
    if user.role_type == 'Director'
      
        can :create, Schedule
        can :update, Schedule do |schedule|
          schedule.try(:user) == user
        end
        can [:update, :create, :destroy], Roster do |roster|
          roster.try(:user) == user
        end
        
    # TEAM MANAGER ABILITIES
    # =====================================
    elsif user.role_type == 'Manager'
      
      can [:modify_team_info], Team, :manager_id => user.id
      can [:manage], TeamSchedule, :team => { :manager_id => user.id }
            # 
            # can [:modify_team_info], Team do |team|
            #   team.try(:manager_id) == user
            # end
            # can [:create, :update, :destroy], Schedule do |schedule|
            #   schedule.try(:manager_id) == user
            # end
    
    # EVERYONE ELSE
    # =====================================
    else
        can :read, :all
    end
    
    # WEBMASTER CAN DO EVERYTHING!
    # =====================================
    can :manage, :all if user.role_type == "God"
    
  end
end
