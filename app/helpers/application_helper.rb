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

    def like_helper(post)
        if logged_in?
            if post.liked?(current_user) 
                button_to "Like", like_path(post), method: "put", disabled: true   
            else 
                button_to "Like", like_path(post), method: "put" 
            end
        end
    end

    def post_delete_helper(post)
        if logged_in? && current_user.id == post.user_id
            button_to "Delete Post", user_path(post), :method => :delete
        end
    end
end
