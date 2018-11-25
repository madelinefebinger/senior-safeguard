Rails.application.routes.draw do
  devise_for :users

  #Nested resource
  resources :scams do
  	resources :comments
  end

  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  get '/about' => 'pages#about'
  get '/learn' => 'pages#learn'

  # Create routes for friend request functionality
  post '/users/add_friend' => 'users#add_friend'
  post '/users/accept_friend' => 'users#accept_friend'
  post '/users/remove_friend' => 'users#remove_friend'

  patch "scams/edit" => "scams#edit", :as => "scam/edit"
end
