class Post < ApplicationRecord
    has_many :likes
    has_many :comments
    has_many :post_categories
    has_many :categories, through: :post_categories
    accepts_nested_attributes_for :categories
    validates :image_url, :title, :content, presence: true
    validates :image_url, uniqueness: true
end
