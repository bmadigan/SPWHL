class Ability
  include CanCan::Ability

  def initialize(user)
    
    user ||= User.new # guest user (not logged in)
    
    alias_action :update, :edit, :to => :modify_info
    
    # LEAGUE DIRECTOR ABILITIES
    # =====================================
    if user.role_type == 'Director'
      
        can :create, Schedule
        can :update, Schedule do |schedule|
          schedule.try(:user) == user
        end
        can [:manage], Roster, :team => { :league_id => { :league => { :director_id => user.id }}}
        can [:modify_info], League, :director_id => user.id
        can :read, :all
        
    # TEAM MANAGER ABILITIES
    # =====================================
    elsif user.role_type == 'Manager'
      
      can [:modify_info], Team, :manager_id => user.id
      can [:modify_info], TeamSchedule, :team_schedule => { :team => { :manager_id => user.id }}
      can :read, :all
    
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
