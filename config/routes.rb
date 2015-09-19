Rails.application.routes.draw do
  root 'application#home'
  
  get '/game/:id' => 'application#game'
  
  get '/game/edit/:id' => 'application#edit_game'
  get '/game/change/:id' => 'application#change_game'
  get '/game/destroy/:id' => 'application#destroy_game'
  
  get "/signup" => "users#new"
  get '/users/create' => 'users#create'
  
  get '/login_page' => 'users#login_page'
  get '/login' => 'users#login'
  
  get '/logout' => 'users#logout'
  
  get '/users/view' => 'users#view'
  
  post '/file_upload' => 'application#file_upload'
end
