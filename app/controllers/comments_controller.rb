class CommentsController < ApplicationController
    include ApplicationHelper
    
    
    def create
        
        @post = Post.find_by(id: params[:id])
        
        @comment = Comment.new(content: params[:comment][:content], user_id: current_user.id, post_id: @post.id)
        if @comment.save
            redirect_to post_path(@post)
        else
            flash.now[:alert] = "There was a problem"
        end
    end

    def destroy
        @comment = Comment.find_by(id: params[:id])
        if @comment.destroy
            redirect_to user_posts_path(@comment)
            flash[:message] = "Your comment was successfully deleted"
        else
            flash.now[:alert] = "Comment wasn't deleted please try again"
        end
    end
    
end