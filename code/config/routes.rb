Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  get '/about' => 'pages#about'
  get '/friends' => 'pages#friends'
  get '/request' => 'pages#request'

end
