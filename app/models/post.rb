class Post < ApplicationRecord
    belongs_to :car, optional: true
    belongs_to :user
    has_many :likes
    has_many :comments
    has_many :post_categories, dependent: :destroy
    has_many :categories, through: :post_categories
    validates :image_url, :title, :content, presence: true
    validates :image_url, uniqueness: true

    def liked?(user)
        !!self.likes.find{|like| like.user_id == user.id}
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
