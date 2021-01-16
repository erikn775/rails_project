class CategoriesPost < ApplicationRecord
    belongs_to :posts
    belongs_to :categories
end
