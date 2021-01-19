class Car < ApplicationRecord
    has_many :posts
    belongs_to :user
    validates :year, :make, :model, :color, :transmission, :body_style, :engine, :mileage, presence: true

    
end
