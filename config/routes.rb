Rails.application.routes.draw do
  root                  'players#index'
  resources :players,      only: [:edit, :update, :show, :create, :new]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
