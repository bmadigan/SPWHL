Soopeewee::Application.routes.draw do

  resources :mediafiles

  get "admin/index"

  #match '/schedules(/:year(/:month))' => 'schedules#index', :as => :calendar, :constraints => {:year => /\d{4}/, :month => /\d{1,2}/}

  resources :arenas
  resources :rosters, :except => :index
  resources :tournaments
  resources :schedules
  resources :teams do
    resources :rosters
  end
  resources :leagues
  resources :seasons
  resources :standings
  resources :pages
  resources :articles
  resources :team_schedules
  
  get "teams/get_select_teams"
  
  # Admin Matched Routes
  # --------------------------------------
  match '/admin/leagues/admin_index' => "leagues#admin_index", :as => 'league_admin' 
  match '/admin/articles/admin_index' => "articles#admin_index", :as => 'article_admin' 
  match '/admin/rosters/admin_index' => "rosters#admin_index", :as => 'rosters_admin' 
  match '/admin/pages/admin_index' => "pages#admin_index", :as => 'page_admin' 
  match '/admin/schedules/admin_index' => "schedules#admin_index", :as => 'schedule_admin' 
  match '/admin/schedules/director_index/:id' => "schedules#director_index", :as => 'schedule_director_admin' 
  match '/admin/schedules/update_standings/:id' => "schedules#update_standings", :as => 'update_standings'
  match '/admin/schedules/save_standings/:id' => "schedules#save_standings", :as => 'save_standings'
  match '/admin/teams/:id/admin_roster' => "teams#admin_roster", :as => 'team_rosters_admin'

  # Public Mathced Routes
  # --------------------------------------
  resources :leagues do
    resources :teams
    resources :schedules
  end
  match '/leagues/:id/admin_standings' => "leagues#admin_standings", :as => 'admin_league_standings'
  match '/leagues/:id/standings' => "leagues#standings", :as => 'league_standings', :method => 'read'
  match '/leagues/:id/rosters' => "leagues#rosters", :as => 'league_rosters', :method => 'read'
  match '/teams/:id/full_schedule' => "teams#full_schedule", :as => 'team_full_schedule'
  match '/teams/:id/roster' => 'teams#roster', :as => 'team_roster'
  
  #match '/pages/index/:id' => 'pages#index', :as => 'pages'
  

  # devise_for :users, :path_names => { :sign_up => "register" }
  # resources :users
  devise_for :users, :path_prefix => 'd'
  resources :users
  
  get "home/index"
  root :to => "home#index"
  
end
