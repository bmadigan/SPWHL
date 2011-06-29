Soopeewee::Application.routes.draw do

  resources :team_schedules

  get "admin/index"

  match '/schedules(/:year(/:month))' => 'schedules#index', :as => :calendar, :constraints => {:year => /\d{4}/, :month => /\d{1,2}/}

  resources :arenas
  resources :rosters
  resources :tournaments
  resources :schedules
  resources :teams
  resources :leagues
  resources :seasons

  # devise_for :users, :path_names => { :sign_up => "register" }
  # resources :users
  devise_for :users, :path_prefix => 'd'
  resources :users
  
  get "home/index"
  root :to => "home#index"
  
end
