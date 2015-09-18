class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def home
    render "index"
  end
  
  def game1
    @gamename = "Desktop"
    @gamenum = 1
    render 'game', :layout => false
  end
end
