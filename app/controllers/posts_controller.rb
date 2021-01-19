class PostsController < ApplicationController
    include PostsHelper
    include ApplicationHelper
    before_action :require_login

    def index
        @posts = filter(params[:filter])
    end

    def new
        @post = Post.new
        @post.post_categories.build
    end

    def create
        @post = current_user.posts.new(post_params)  
        
        if @post.save
            redirect_to user_posts_path(current_user)
        else
            flash.now[:alert] = "There was a problem"
            render :new
        end
    end

    def like
        @post = Post.all.find_by(id: params[:id])
        Like.create(user_id: current_user.id, post_id: @post.id)
        redirect_to user_posts_path(current_user)
    end

    def comment
        @post = Post.all.find_by(id: params[:id])
        @comment = Comment.new(content: params[:post][:content], user_id: current_user.id, post_id: @post.id)
        if @comment.save
            redirect_to user_posts_path(current_user)
        else
            flash.now[:alert] = "There was a problem"
        end
    end

    def show
        @post = Post.find_by(id: params[:id])
        
    end

    def edit
        @post = Post.find_by(id: params[:id])
    end

    def update
        @post = Post.find_by(id: params[:id])
        @post.update(post_params)
        redirect_to (@post)
    end

    def destroy
        @post = Post.find_by(id: params[:id])
        if current_user.id == @post.user_id
            @post.destroy
            redirect_to user_posts_path(@post)
        end
    end


    private

    def post_params
        params.require(:post).permit(:image_url, :title, :content, :car_id, category_ids: [])
    end

    def comment_params
        params.require(:comment).permit(:content, user_id, post_id)
    end
end
