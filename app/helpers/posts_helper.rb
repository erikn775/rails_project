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

    def comment_helper(post)
        if logged_in?
            button_to "Comment", comment_path(@post), method: "put"
        end
    end
end
