Rails.application.routes.draw do
  devise_for :users
  resources :messages
  resources :groups
  root 'messages#index'
end
