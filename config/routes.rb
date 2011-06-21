Soopeewee::Application.routes.draw do
  resources :arenas

  resources :rosters

  resources :tournaments

  resources :schedules

  resources :teams

  resources :leagues

  resources :seasons

  devise_for :users
  
  get "home/index"
  root :to => "home#index"
  
  
end
