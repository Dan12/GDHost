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
  
  def file_upload
    Dir.mkdir "#{Rails.root}/app/assets/games/game2"
    File.open("#{Rails.root}/app/assets/games/game2/#{params[:datafile].original_filename}", "w+") do |f|
      f.write(params[:datafile].read.encode("ASCII-8BIT").force_encoding("utf-8"))
    end
    redirect_to '/'
  end
end
