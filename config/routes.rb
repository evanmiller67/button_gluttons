ButtonGluttons::Application.routes.draw do
  resources :players

  root :to => 'dashboard#index'
end
