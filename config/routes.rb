ButtonGluttons::Application.routes.draw do
  match '/players' => redirect('/')

  resources :players, :only => [:show, :update, :edit]
  resources :fights,  :except => [:destroy, :index]
  resources :rounds,  :only => [:show, :update]
    
  root :to => 'dashboard#index'
end
