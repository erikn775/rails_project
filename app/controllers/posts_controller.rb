class PostsController < ApplicationController
    include ApplicationHelper
    before_action :require_login

    def index
        @posts = Post.all
    end

    def new
        @post = Post.new
        @post.post_categories.build
    end

    def create
        
        @post = current_user.posts.new(post_params)   
        if @post.save
            redirect_to user_path(current_user)
        else
            flash.now[:alert] = "There was a problem"
            render :new
        end
    end

    def add_category
        @post = Post.find(params[:id])
        
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
        redirect_to(@post)
    end

    def destroy
        @post = Post.find_by(id: params[:id])
        @post.destroy
        redirect_to account_path(@post)
    end


    private

    def post_params
        params.require(:post).permit(:image_url, :title, :content, category_ids: [])
    end
end
