class CategoriesController < ApplicationController
    include ApplicationHelper
    before_action :require_login
    

    def index
        @categories = Category.all
    end

    def new 
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)
        if @category.save
            redirect_to categories_path
        else
            flash.now[:alert] = flash_helper(@category)
            render :new
        end
    end

    def show
        @category = Category.find_by(id: params[:id])
    end

    def destroy
        @category = Category.find_by(id: params[:id])
        @category.destroy
        redirect_to categories_path
    end

    private
    
    def category_params
        params.require(:category).permit(:name)
    end
end
