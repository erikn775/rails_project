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

    def display_image(image)
        image_tag(image)
    end

    def date_posted(created_at)
        created_at.strftime("%b %d, %Y")
    end

    def time_posted(created_at)
        created_at.strftime("%I:%M %P %b %d, %Y")
    end

    def flash_helper(model)
        model.errors.full_messages.join(', ')+" "+"(╯°□°）╯︵ ┻━┻  .... Try Again"
    end

end
