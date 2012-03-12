ButtonGluttons::Application.routes.draw do
  match '/players' => redirect('/')

  resources :players
  resources :fights
    
  root :to => 'dashboard#index'
end
