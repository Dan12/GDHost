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
          redirect_to "/users/view"
        else
          redirect_to "/signup"
        end
    end
    
    def login_page
        render "login"
    end
    
    def login
    
    end
    
    def view
        @user = User.find_by(id: session[:user_id])
        render 'view'
    end
    
    def edit
        
    end
    
    def update
        
    end
    
    def destroy
        
    end
end