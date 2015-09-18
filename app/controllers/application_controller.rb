class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :login_required, :except => [:new, :create, :login_page, :login]
  
  def login_required
    if session[:user_id] == nil || User.find_by(id: session[:user_id]) == nil
      redirect_to "/"
    end
  end
  
  def home
    render "index"
  end
  
  def game
    @gamenum = params[:id]
    @gamename = Game.find_by(id: @gamenum).name
    render 'game', :layout => false
  end
  
  def file_upload
    @filename = File.basename(params[:datafile].original_filename)
    @game = Game.new
    @game.user_id = session[:user_id]
    if @filename.index(".unity3d") != nil
      @game.name = @filename[0..@filename.index(".unity3d")]
      
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
