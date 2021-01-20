class CommentsController < ApplicationController
    include ApplicationHelper
    
    
    def create
        
        @post = Post.find_by(id: params[:id])
        
        @comment = Comment.new(content: params[:comment][:content], user_id: current_user.id, post_id: @post.id)
        binding.pry
        if @comment.save
            redirect_to post_path(@post)
        else
            flash.now[:alert] = "There was a problem"
        end
    end

    def destroy

    end
    
end