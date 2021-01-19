class SessionsController < ApplicationController
    def new

    end

    def create
        @user = User.find_by(username: params[:username])
        if @user != nil && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_posts_path(@user)
        else
            flash.now[:alert] = "Login Failed (╯°□°）╯︵ ┻━┻  .... Try Again"
            render :new
        end
    end

    def destroy
        reset_session
        redirect_to root_path
    end
end
