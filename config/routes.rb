ButtonGluttons::Application.routes.draw do
  match '/players' => redirect('/')

  resources :players

  root :to => 'dashboard#index'
end
