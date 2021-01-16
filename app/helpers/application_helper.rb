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

    def date_posted(created_at)
        created_at.strftime("%b %d, %Y")
    end

    def time_posted(created_at)
        created_at.strftime("%I:%M %P %b %d, %Y")
    end

    def filter(params)
    
            
        if params != nil
            params = params.capitalize
                if Category.find_by(name: "#{params}") != nil
                    Category.find_by(name: "#{params}").posts
                elsif params == "All"
                    Post.all
                else
                    flash.now[:alert] = "No tag with that name"
                    Post.all
                end
        else
            Post.all
        end
    end

    
end
