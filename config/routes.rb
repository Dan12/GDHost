Rails.application.routes.draw do
  root 'application#home'
  
  get '/game/:id' => 'application#game'
  
  get "/signup" => "users#new"
  get '/users/create' => 'users#create'
  
  get '/login_page' => 'users#login_page'
  get '/login' => 'users#login'
  
  get '/logout' => 'users#logout'
  
  get '/users/view/:id' => 'users#view'
  get '/users/edit/:id' => 'users#edit'
  get '/users/update/:id' => 'users#update'
  
  post '/file_upload' => 'application#file_upload'
end
