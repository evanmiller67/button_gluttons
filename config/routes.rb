ButtonGluttons::Application.routes.draw do
  match '/players'      => redirect('/')
  match '/leaderboard'  => 'dashboard#leaderboard'

  resources :players, :only => [:show, :update, :edit, :new]
  resources :fights,  :except => [:destroy, :index]
  resources :rounds,  :only => [:show, :update]
    
  root :to => 'dashboard#index'
end
