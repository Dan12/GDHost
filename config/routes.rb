Rails.application.routes.draw do
  root 'application#home'
  
  get '/game1' => 'application#game1'
  
  get "/signup" => "users#new"
  get '/users/create' => 'users#create'
  
  get '/users/view' => 'users#view'
  
  post '/file_upload' => 'application#file_upload'
end
