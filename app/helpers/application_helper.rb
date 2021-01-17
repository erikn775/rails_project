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
                    Category.find_by(name: "#{params}").posts.order('created_at DESC')
                elsif params == "All"
                    Post.all.order('created_at DESC')
                else
                    flash.now[:alert] = "No tag with that name"
                    Post.all.order('created_at DESC')
                end
        else
            Post.all.order('created_at DESC')
        end
    end

    def delete_helper(model)
        if logged_in? && current_user.id == model.user_id
            button_to "Delete", post_path(model), :method => :delete, data: {confirm: "Are you sure?"}
        end
    end
    
end
