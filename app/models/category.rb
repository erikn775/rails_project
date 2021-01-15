class Category < ApplicationRecord
    has_many :post_categories
    has_and_belongs_to_many :posts
    validates :name, presence: true, uniqueness: true
end
