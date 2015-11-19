class UsersController < ApplicationController
    
    def new
        render 'new'
    end
    
    def create
        @user = User.new
        @user.username = params[:username]
        @user.password = params[:password]
        @user.password_confirmation = params[:password_confirmation]
        
        if @user.save
          session[:user_id] = @user.id
          session[:error_msg] = nil
          redirect_to "/users/view/#{@user.id}"
        else
            if @user.password == @user.password_confirmation
                session[:error_msg] = "Password and Confimation don't match"
            else
                session[:error_msg] = "Username taken"
            end
            redirect_to "/signup"
        end
    end
    
    def login_page
        render "login"
    end
    
    def login
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            session[:error_msg] = nil
            redirect_to "/"
        else
            if !@user
                session[:error_msg] = "Username not found"
            else
                session[:error_msg] = "Wrong password"
            end
            redirect_to "/login_page"
        end
    end
    
    def logout
       reset_session
       redirect_to "/"
    end
    
    def view
        @user = User.find_by(id: params[:id])
        if @user != nil
            render 'view'
        else
            redirect_to '/'
        end
    end
    
    def edit
        if params[:id].to_s == session[:user_id].to_s
            @user = User.find_by(id: session[:user_id])
            if @user != nil
                render "edit"
            else
                redirect_to '/'
            end
        else
            redirect_to "/users/view/#{params[:id]}"
        end
    end
    
    def update
        if params[:id].to_s == session[:user_id].to_s
            @user = User.find_by(id: session[:user_id])
            if @user != nil
                @user.username = params[:username]
                @user.password = params[:password]
                @user.password_confirmation = params[:password_confirmation]
                
                if @user.save
                  session[:error_msg] = nil
                  redirect_to "/users/view/#{params[:id]}"
                else
                    if @user.password == @user.password_confirmation
                        session[:error_msg] = "Password and Confimation don't match"
                    else
                        session[:error_msg] = "Username taken"
                    end
                    redirect_to "/users/edit/#{@user.id}"
                end
            else
                redirect_to '/'
            end
        else
            redirect_to "/users/view/#{params[:id]}"
        end
    end
    
    def index
       render "index" 
    end
end