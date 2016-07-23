Rails.application.routes.draw do
  root 'games#new'

  resources :games, only: [:new, :create, :show] do
    resources :turns, only: [:new, :create]
  end
end
