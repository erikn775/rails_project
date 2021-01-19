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
    
end
