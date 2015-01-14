Rails.application.routes.draw do
  root 'diffs#new'
  resources :diffs, only: [:show, :create, :new, :index]
end
