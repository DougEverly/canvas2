Rails.application.routes.draw do
  #get '/users' => 'users#index'
  root 'users#index'
  resources :user_to_roles
  resources :roles
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
