class UsersController < ApplicationController
    include ApplicationHelper

    def new
        @user = User.new
    end
    
    def create
        user = User.new(user_params)
        if user.save
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            flash.now[:alert] = "Sign up Failed (╯°□°）╯︵ ┻━┻  .... Try Again"
            render :new
        end
    end
    
    def show
        @user = User.find(session[:user_id])
        @posts = filter(params[:filter])
    end

    private
    
    def user_params
        params.require(:user).permit(:name, :email, :username, :password)
    end
end
