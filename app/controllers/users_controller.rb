class UsersController < ApplicationController
    include ApplicationHelper

    def new
        @user = User.new
    end
    
    def create
        user = User.new(user_params)
        if user.save
            session[:user_id] = user.id
            redirect_to user_posts_path(user)
        else
            flash.now[:alert] = flash_helper(user)
            render :new
        end
    end
    
    def show
        @user = User.find(session[:user_id])
        
    end

    def most_posted
        
    end

    private
    
    def user_params
        params.require(:user).permit(:name, :email, :username, :password)
    end
end
