module ApplicationHelper

    def logged_in?
        !!session[:user_id]
    end

    def current_user
    end

    def require_login
        return head(:forbidden) unless session.include?(:user_id)
    end
end
