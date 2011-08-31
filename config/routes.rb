Soopeewee::Application.routes.draw do

  resources :mediafiles

  get "admin/index"

  #match '/schedules(/:year(/:month))' => 'schedules#index', :as => :calendar, :constraints => {:year => /\d{4}/, :month => /\d{1,2}/}

  resources :arenas
  resources :rosters
  resources :tournaments
  resources :schedules
  resources :teams
  resources :leagues
  resources :seasons
  resources :standings
  resources :pages
  resources :articles
  resources :team_schedules
  
  match '/admin/leagues/admin_index' => "leagues#admin_index", :as => 'league_admin' 
  match '/admin/articles/admin_index' => "articles#admin_index", :as => 'article_admin' 
  match '/admin/schedules/admin_index' => "schedules#admin_index", :as => 'schedule_admin' 

  # devise_for :users, :path_names => { :sign_up => "register" }
  # resources :users
  devise_for :users, :path_prefix => 'd'
  resources :users
  
  get "home/index"
  root :to => "home#index"
  
end
