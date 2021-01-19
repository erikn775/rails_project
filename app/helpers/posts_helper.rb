module PostsHelper
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
            button_to "Delete Post", post_path(post), :method => :delete, data: {confirm: "Are you sure?"}
        end
    end

    def post_edit_helper(post)
        if logged_in? && current_user.id == post.user_id
            button_to "Edit Post", edit_post_path(post), method: "get"
        end
    end

    def comment_helper(post)
        if logged_in?
            button_to "Comment", comment_path(@post), method: "get"
        end
    end

    def your_car(post)
        if post.car
            content_tag(:p, "Yes")
        else
            content_tag(:p, "No")
        end
    end

    def filter(params)     
        if params != nil
            params = params.capitalize
                if Category.find_by(name: "##{params}") != nil
                    Category.find_by(name: "##{params}").posts.order('created_at DESC')
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
end
