class Car < ApplicationRecord
    belongs_to :user
    validates :year, :make, :model, :color, :transmission, :body_style, :engine, :mileage, :presence: true
end
