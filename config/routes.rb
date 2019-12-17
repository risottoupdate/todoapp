Rails.application.routes.draw do

  devise_for :users
  resources :tasks
  root to: 'tasks#index'

  resources :users, only: :show

end
