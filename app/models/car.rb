class Car < ApplicationRecord
    has_many :posts
    belongs_to :user
    validates :year, :make, :model, :color, :transmission, :body_style, :engine, :mileage, presence: true
    scope :save_the_manuals, -> { where(transmission: 'Manual') }
    
end
