class Ability
  include CanCan::Ability

  def initialize(user)
    
    user ||= User.new # guest user (not logged in)
    
    alias_action :update, :edit, :director_index, :to => :modify_info
    
    # Public viewable actions. :read only means :show and :index
    # This is needed otherwise we can access denied.
    alias_action :full_schedule, :standings, :roster, :rosters, :to => :viewable_public
    
    # LEAGUE DIRECTOR ABILITIES
    # =====================================
    if user.role_type == 'Director'
            
      can [:access], Team, :team => { :league_id => { :league => { :director_id => user.id }}}
      can [:access], Roster#, :team => { :league_id => { :league => { :director_id => user.id }}}
      #can [:admin_standings], League, :director_id => user.id
      can [:access], League, :director_id => user.id
      can :director_index, :schedules
      
      can :read, :all
      can :viewable_public, :all
        
    # TEAM MANAGER ABILITIES
    # =====================================
    elsif user.role_type == 'Manager'
      
      # can [:modify_info], Team, :manager_id => user.id
      # can [:modify_info], TeamSchedule, :team_schedule => { :team => { :manager_id => user.id }}
      can :read, :all
      can :viewable_public, :all
    
    # EVERYONE ELSE
    # =====================================
    else
        can :read, :all
        can :viewable_public, :all
    end
    
    # WEBMASTER CAN DO EVERYTHING!
    # =====================================
    can :access, :all if user.role_type == "God"
    
  end
  
end