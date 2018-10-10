Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get '/about' => 'pages#about'
  get '/friends' => 'pages#friends'
  get '/request' => 'pages#request'

end
