module ApplicationHelper

    def logged_in?
        !!session[:user_id]
    end

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def require_login
        return head(:forbidden) unless session.include?(:user_id)
    end

    def authenication_required
        if !logged_in?
            redirect_to login_path
        end
    end

    def display_image(image)
        image_tag(image)
    end

    def time_posted(created_at)
        created_at.strftime("%b %d, %Y")
    end
end
