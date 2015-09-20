Rails.application.routes.draw do
  root 'application#home'
  
  get '/game/:id' => 'application#game'
  get '/game/edit/:id' => 'application#edit'
  get '/game/update/:id' => 'application#update'
  get '/game/destroy/:id' => 'application#destroy'
  
  get "/signup" => "users#new"
  get '/users/create' => 'users#create'
  
  get '/login_page' => 'users#login_page'
  get '/login' => 'users#login'
  
  get '/logout' => 'users#logout'
  
  get '/users/view/:id' => 'users#view'
  get '/users/edit/:id' => 'users#edit'
  get '/users/update/:id' => 'users#update'
  
  get 'send_game' => 'application#send_game'
  
  post '/file_upload' => 'application#file_upload'
end
