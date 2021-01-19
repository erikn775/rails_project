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

    def omniauth
        user = User.create_from_omniauth(auth)
        if user.valid?
            session[:user_id] = user.id
            flash[:message] = "You have successfully signed in with Google Oauth"
            redirect_to user_posts_path(user)
        else
            flash[:message] = flash_helper(user)
            redirect_to root_path
        end
    end

    private 
    
    def auth
        request.env['omniauth.auth']
    end
end
