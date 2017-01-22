Rails.application.routes.draw do
  devise_for :players

  root                        'players#index'

  devise_scope :player do get '/players/sign_out' => 'devise/sessions#destroy' end

  resources :players,         only: [:edit, :update, :show, :create, :new, :index]
  resources :matches,         only: [:update, :show, :create, :index]
  resources :teams,           only: [:edit, :update, :show, :create, :new, :index]
  resources :votes

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
