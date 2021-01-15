class PostsController < ApplicationController

    def index

    end

    def new

    end

    def create

    end

    def show

    end

    def edit

    end

    def update

    end

    def destroy

    end

    private

    def post_params
        params(:post).permit(:image_url, :title, :content, :category_id)
    end
end
