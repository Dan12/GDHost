class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :login_required, :only => [:edit, :update, :destroy, :file_upload]
  
  def login_required
    if session[:user_id] == nil || User.find_by(id: session[:user_id]) == nil
      session[:error_msg] = "You must signup before completing this action"
      redirect_to "/signup"
    end
  end
  
  def home
    render "index"
  end
  
  def game
    @game = Game.find_by(id: params[:id])
    render 'game', :layout => false
  end
  
  def update
    @game = Game.find_by(id: params[:id])
    if @game.user_id.to_s == session[:user_id].to_s
      @game.img_url = params[:img_url]
      @game.save
    end
    redirect_to "/game/#{@game.id}"
  end
  
  def edit
    @game = Game.find_by(id: params[:id])
    if @game.user_id.to_s == session[:user_id].to_s
      render 'edit'
    else
      redirect_to "/game/#{@game.id}"
    end
  end
  
  def file_upload
    @filename = File.basename(params[:datafile].original_filename)
    @game = Game.new
    @game.img_url = "http://lorempixel.com/300/300/technics"
    @game.user_id = session[:user_id]
    if @filename.index(".unity3d") != nil
      @game.name = @filename[0..(@filename.index(".unity3d")-1)]
      
      if @game.save
        Dir.mkdir "#{Rails.root}/app/assets/games/game#{@game.id}"
        File.open("#{Rails.root}/app/assets/games/game#{@game.id}/#{@filename}", "w+") do |f|
          f.write(params[:datafile].read.encode("ASCII-8BIT").force_encoding("utf-8"))
        end
      end
    end
    redirect_to '/'
  end
end
